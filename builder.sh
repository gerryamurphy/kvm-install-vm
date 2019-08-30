
#!/bin/bash
read -p "VM Distribution: (ubuntu or centos) " dist
read -p "Requester (initials of requester): " owner
read -p "VM Purpose (VM purpose, example titan-4.02): " purpose
read -p "VM Size (micro/mini/max): " size

domain=$owner-$dist-$purpose
#echo $domain

# defaults

if [[ $size = *"micro"* ]]; then
  cpu=2
  memory=2048
  disk=20
elif [[ $size = *"mini"* ]]; then
  cpu=4
  memory=8096
  disk=80
elif [[ $size = *"max"* ]]; then
  cpu=8
  memory=16000
  disk=120
else 
  echo "Error: unsupported VM size requested"
  exit
fi


if [[ $dist = *"ubuntu"* ]]; then
  echo "Making ubuntu VM"
  ./kvm-install-vm create -v -t ubuntu1804 -c $cpu -m $memory -d $disk  $domain
elif [[ $dist = *"centos"* ]]; then
  echo "Making CentOS VM"
  ./kvm-install-vm create -v -t centos7 -c $cpu -m $memory -d $disk  $domain
else
  echo "Error: Unsupported OS requested"
  exit
fi 
