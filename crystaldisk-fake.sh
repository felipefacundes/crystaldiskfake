#!/bin/bash
# Creator: Felipe Facundes
# E-mail: felipe.facundes@gmail.com
# License GPLv3
bash -c "sync && echo 3 | sudo tee /proc/sys/vm/drop_caches"
tput setaf 2; echo "Write Test:"
tput sgr0
echo
dd if=/dev/zero of=.test_disk_file bs=8M count=512 oflag=dsync status=progress && sync
bash -c "sync && echo 3 | sudo tee /proc/sys/vm/drop_caches"
bash -c "sync && echo 3 | sudo tee /proc/sys/vm/drop_caches"
tput setaf 2; echo "Read Test:"
tput sgr0
echo
dd if=.test_disk_file of=/dev/null bs=8k oflag=dsync status=progress && sync
rm .test_disk_file

tput setaf 2
echo "now test with hdparm"
echo "run:"
echo "sudo hdparm -Tt /dev/sda"
tput sgr0
