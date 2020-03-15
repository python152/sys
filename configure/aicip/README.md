


MBR total size
    - 446 + 64 + 2 = 512 

where:

    446 - bootstrap
    64  - partition table
    2   - signature


To restart MBR and extended partition

    dd if=backup-sda.dd of=/dev/sdc
    sfdisk /dev/sdc < backup-sda.sfdisk 


To copy from on disk to another the MBR (identified partition)

    dd if=/dev/sda of=/dev/sdb bs=512 count=1

To copy MBR for different partition size:

    dd if=/dev/sda of=/tmp/mbrsda.bak bs=512 count=1

Now to restore to any sdb

    dd if=/dev/mbrsda.bak of=/dev/sdb bs=446 count=1

This will preserve the partition schema

