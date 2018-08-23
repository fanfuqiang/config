# Preparation
- In open Ubuntu 18.04 machine click Parallels Actions -> "Install Parallels Tools"
- A "Parallels Tools" CD will popup on your Ubuntu desktop.
- Open it by double mouse click, copy all the content to a new, empty directory on a desktop, name it for e.g. "parallels_fixed"

- Open terminal, change directory to parallels_fixed (`cd ~/Desktop/parallels_fixed`)
- Make command line installer executable (`chmod +x install`)
- Change directory to "installer" (`cd installer`)
- Make few other scripts executable: `chmod +x installer.* *.sh prl_*`

# We have to modify some files:

- Go to kmods directory (`cd ~/Desktop/parallels_fixed/kmods`) and extract the files (`tar -xzf prl_mod.tar.gz`)
- Remove prl_mod.tar.gz file from that directory (`rm prl_mod.tar.gz`)

# Changing file 1/3
- Go to "prl_eth/pvmnet/" (`cd ~/Desktop/parallels_fixed/kmods/prl_eth/pvmnet`) directory
- Open "pvmnet.c" file in a text editor
- Edit line 438: 
```C
MODULE_LICENSE("Parallels");
``` 
  to 
```C
MODULE_LICENSE("GPL");
```
- Save

# Changing file 2/3
- Go to "prl_tg/Toolgate/Guest/Linux/prl_tg/" (`cd ~/Desktop/parallels_fixed/kmods/prl_tg/Toolgate/Guest/Linux/prl_tg`) directory
- Open "prltg.c" file in a text editor
- Edit line 1535: 
```C
MODULE_LICENSE("Parallels");
``` 
  to 
```C
MODULE_LICENSE("GPL");
```
- Save

# Changing file 3/3
- Go to "prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze/" (`cd ~/Desktop/parallels_fixed/kmods/prl_fs_freeze/Snapshot/Guest/Linux/prl_freeze`)
- Open "prl_fs_freeze.c" file in a text editor
- in line 212 you will find a function "thaw_timer_fn":
```C
void thaw_timer_fn(unsigned long data)
{
   struct work_struct *work = (struct work_struct *)data;
   
   schedule_work(work);
}
```

Change it to:

```C
void thaw_timer_fn(unsigned long data)
{
   struct work_struct *work = (struct work_struct *)data;
   
   schedule_work(work);
}

void thaw_timer_fn_new_kernel(struct timer_list *data)
{
   struct work_struct *work = data->expires;
   
   schedule_work(work);
}
```

Then change a line 220 from:

```C
DEFINE_TIMER(thaw_timer, thaw_timer_fn, 0, (unsigned long)&(thaw_work));
```

to

```C
#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
DEFINE_TIMER(thaw_timer, thaw_timer_fn_new_kernel);
#else
DEFINE_TIMER(thaw_timer, thaw_timer_fn, 0, (unsigned long)&(thaw_work));
#endif
```

# Zip it back

- Go to kmods directory (`cd ~/Desktop/parallels_fixed/kmods`) and zip:
`tar -zcvf prl_mod.tar.gz . dkms.conf Makefile.kmods`
- Now you should see "prl_mod.tar.gz" file in this directory

# Install!

- Go one level up (`cd ../` or `cd ~/Desktop/parallels_fixed`) and install it by running `sudo ./install`

In case of problems with Sharing Folder try to `sudo chmod +x /usr/bin/prlfsmountd`. (Suggested by @macdoor - Thanks!)


First two changes are hacks, changing licensing type and i cannot post complete, built package.
Third file change was needed as backward incompatible changes were released in version 4.15 of the Linux kernel, on November 2017 by Linus. 
https://github.com/torvalds/linux/blob/master/include/linux/time.h
