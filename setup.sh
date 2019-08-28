#!/bin/bash

if [ ! -d "/home/apcon/iso_images" ]; then
  echo "Error: ISO folder is missing"
  exit
fi

if [ ! -d "/home/apcon/VMImages" ]; then
  echo "Error: VMImages folder is missing"
  exit
fi

yum install -y  genisoimage virt-install libguestfs-tools-c qemu-img libvirt-client wget
