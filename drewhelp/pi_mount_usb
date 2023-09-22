## How to setup mount / auto-mount USB Hard Drive on Raspberry Pi
 
Follow the simple steps in the order mentioned below to have your USB drive mounted on your Raspberry Pi every time you boot it.

These steps are required especially if your are setting up a Samba share, or a 24x7 torrent downloader, or alike where your Raspberry Pi must have your external storage already mounted and ready for access by the services / daemons.

Step 0.
Plug in your USB HDD / Drive to Raspberry Pi
If you are using a NTFS formatted drive, install the following

```sudo apt-get install ntfs-3g```

Step 1.
Log on pi using ssh terminal and execute:

```sudo blkid```

You will see something like the following:

lrwxrwxrwx 1 root root 10 Jan  1  1970 0AC4D607C4D5F543 -> ../../sda1
Note down the value of the UUID --> 0AC4D607C4D5F543

Step 2.
Create a location for mount point:

```sudo mkdir /mnt/volume```

Give proper permission:

```sudo chmod 770 /mnt/volume```

Step 3.
Get the uid, gid for pi user and group with id command (usually 1000)

Step 4.
Mount the USB Drive and then check if it is accessible at /mnt/volume

```sudo mount -t ntfs-3g -o nofail,uid=1000,gid=1000,umask=007 /dev/sda1 /mnt/volume```

Or:

```sudo mount /dev/sda1 /mnt/volume```

Note:
ntfs-3g for NTFS Drives
vfat for FAT32 Drives
ext4 for ext4 Drives

Step 5.
Now, we will configure RasPi to do this after every reboot:
Take a backup of current fstab and then edit

```
sudo cp /etc/fstab /etc/fstab.backup
sudo nano /etc/fstab
```

Add the mount information in the fstab file (replace UUID with your own):

```UUID=0AC4D607C4D5F543 /mnt/volume ntfs-3g async,big_writes,noatime,nodiratime,nofail,uid=1000,gid=1000,umask=007 0 0```

Or:

```/dev/sda1 /mnt/volume ntfs defaults 0 0```

Step 6.
Reboot

```sudo reboot```

Step 8. (Optional, required if using as data storage for owncloud)
If you are configuring ownCloud's data directory on your NAS drive, it should be having a 770 permission for www-data user. You can simply add user www-data to pi group, since its already having 770 as permission as set above in fstab.

```sudo usermod -a -G pi www-data```

## Alternative 2
This is a short guide on how to connect an External Hard Drive to the Raspberry Pi! Most external Hard Drives are quite juicy and will require a USB Hub to run in a stable manner, so please do check this before trying to install your drive!

First step is to plug it in, and then switch on your Pi! It should boot up as normal, so go ahead and log in to Raspian as usual.

Step 1. Is it there?!

If you want to check for the current storage devices attached to your Pi, simply run the command:

```sudo blkid```

This reveals that we currently have our “Seagate Expansion Drive” attached.

Step 2. Check the Partitions

We now need to check the boot name of our Seagate’s partition.

```sudo fdisk –l```

Reveals that our drive is located at /dev/sda1

Step 3. Mounting it.

Now we know where our drive is, we need to mount it:

```sudo mount /dev/sda1 /mnt/volume```

The folder “/mnt” is the standard location for mounting permanent media, but you can always create your own folder if required using the “mkdir” command.

That’s it! Our drive is mounted.

Step 4. Permissions.

As our drive is formatted in NTFS, we might need to change the /mnt drive permissions in order to enable proper access. Simply run the following command:

```sudo chmod 775 /mnt/volume```

This will change your permissions and allow you to access the drive.

To test this, let’s try to create a folder. . . 

```
cd /mnt/volume
mkdir IMAFOLDER
cd IMAFOLDER
```

Great! So we can read and write to our hardrive!

Step 5. Automounting our drive.

If you want your Hard Drive to mount from boot, we need to set this up!

First step is to edit our "fstab" file

```sudo nano /etc/fstab```

This will open up the file in nano text editor:

We need to add the following line to have our hard drive mount at boot!

```/dev/sda1 /mnt/volume ntfs-3g uid=1000,gid==1000,umask=007,nofail,x-systemd.device-timeout=30 0 0```


You can now reboot your Raspbery Pi, and your Hard Drive will automatically mount!

Step 5. How to unmount.

To unmount the drive, simply run the command:

````sudo umount /mnt/volume````

As long as you’re not currently accessing the drive, it should unmount successfully.