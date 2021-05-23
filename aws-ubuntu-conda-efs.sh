#!/bin/bash

wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
pip install botocore boto3

sudo apt-get update
git clone https://github.com/aws/efs-utils
sudo apt-get -y install binutils
cd efs-utils
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb

sudo mkdir /mnt/efs
sudo chmod 777 /mnt/efs
sudo chown -R $USER /mnt/efs

cd ~/

sudo apt-get install unzip
sudo apt-get install libgomp1

echo "To mount EFS:"
echo "sudo mount -t efs fs-xxxxxxxx:/ /mnt/efs"

