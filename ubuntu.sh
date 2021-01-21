#!/bin/bash

log=log_file.txt


is_root()
{
        [[ $(id -u) -eq 0 ]];
}

if is_root; then
        echo "yep, you are the Demi-God, go ahead please !"
        
else
        echo "WARNING ! moving with  weakness!!"
        exit 1
fi

for i in gcc make linux-headers-$(uname -r) lzop liblzo2-dev liblzo2-2 zlib1g-dev sg3-utils lsscsi  mt-st mtx perl; do
	apt install -y $i
done
		

#1 crating user: mhvtl and group:mhvtl

groupadd -r vtl >>$log
useradd -r -c "VTL Account" -d /opt/mhvtl -g vtl vtl >>$log

#2 creating reruired directories

mkdir -p /opt/mhvtl
mkdir -p /etc/mhvtl
chown -Rf vtl:vtl /opt/mhvtl
chown -Rf vtl:vtl /etc/mhvtl

#3 downloading mtvl tar file from webiste

cd
mkdir src
cd src
wget --no-check-certificate 'https://drive.google.com/file/d/1kxlwcH9ldZZFC4_2c3AkVagVKYSoVFUe/view?usp=sharing' -O mhvtl.tar

tar -xf mhvtl.tar

cd kernel
make&&make install

cd ..
make&&make install

cd ..
rm -rf src

# adding  service  for startup and starting sevices

update-ec.d mhvtl defaults
service mhvtl start


clear
lsscsi -g | grep -E "mediumx|tape"


