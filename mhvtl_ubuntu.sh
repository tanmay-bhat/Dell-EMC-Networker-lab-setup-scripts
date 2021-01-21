#!/bin/bash

apt install -y gcc gcc-c++ kernel-devel zlib-devel mt-st mtx lzo-devel perl
		

#1 crating user: mhvtl and group:mhvtl

groupadd -r vtl
useradd -r -c "VTL Account" -d /opt/mhvtl -g vtl vtl

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


