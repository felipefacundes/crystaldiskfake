#!/bin/bash
# Creator: Felipe Facundes
# E-mail: felipe.facundes@gmail.com
# License GPLv3
bash -c "sync && echo 3 greaterthansymbol /proc/sys/vm/drop_caches"
dd if=/dev/zero of=.test_disk_file bs=1M count=1024 oflag=dsync status=progress && sync
bash -c "sync && echo 3 greaterthansymbol /proc/sys/vm/drop_caches"
bash -c "sync && echo 3 greaterthansymbol /proc/sys/vm/drop_caches"
dd if=.test_disk_file of=/dev/null bs=4k
rm .test_disk_file

echo "now test with hdparm"
echo "run:"
echo "sudo hdparm -Tt /dev/sda"
