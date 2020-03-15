#!/bin/bash

echo "Backup MBR of sda"

dd if=/dev/sda of=/root/mbr.sda.512 bs=512 count=1 

echo "Backup UUID"

lsblk -no NAME,UUID /dev/sda1 > sda1.UUID
lsblk -no NAME,UUID /dev/sdb1 > sdb1.UUID


rsync -aAX --delete --info=progress2 \
    --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/backup"} \
    /	/backup


echo "Auto generate grub main configuration"

grub-mkconfig -o /backup/boot/grub/grub.cfg

echo "$(date)" > /backup/root/LAST_BACKUP

