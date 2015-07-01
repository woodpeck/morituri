#!/bin/bash
sudo apt-get install libbz2-dev libgdal-dev libexpat1-dev libgeos++-dev libpthread-stubs0-dev zlib1g-dev libosmpbf-dev libprotobuf-dev libboost-dev libboost-filesystem-dev

sudo apt-get install gdal-bin

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install gcc-4.9

mkdir -p ~/libs
cd ~/libs
git clone https://github.com/osmcode/libosmium

cd ~/libs
curl http://download.osgeo.org/shapelib/shapelib-1.3.0.tar.gz -o shapelib-1.3.0.tar.gz
tar xzf shapelib-1.3.0.tar.gz
cd shapelib-1.3.0
make
sudo make install

rm shapelib-1.3.0.tar.gz
