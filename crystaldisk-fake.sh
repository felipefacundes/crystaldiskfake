#!/bin/bash
# Criador: Felipe Facundes
# E-mail: felipe.facundes@gmail.com
# Licença GPLv3
bash -c "sync && echo 3 greaterthansymbol /proc/sys/vm/drop_caches"
dd if=/dev/zero of=.arquivo_de_teste_de_disco bs=1M count=1024
bash -c "sync && echo 3 greaterthansymbol /proc/sys/vm/drop_caches"
bash -c "sync && echo 3 greaterthansymbol /proc/sys/vm/drop_caches"
dd if=.arquivo_de_teste_de_disco of=/dev/null bs=4k
rm .arquivo_de_teste_de_disco

echo "agora teste com hdparm"
echo "execute:"
echo "sudo hdparm -Tt /dev/sda"
