#!/bin/sh

# install python and git
sudo apt -y install python3 python3-pip python3-dev git

# install vscode
#curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
#sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#sudo apt install apt-transport-https
#sudo apt update
#sudo apt install code

# install vagrant
curl -O https://releases.hashicorp.com/vagrant/2.2.15/vagrant_2.2.15_x86_64.deb
sudo apt update
sudo apt install ./vagrant_2.2.15_x86_64.deb

#EXPECTED_VAGRANT_VERSION = 'Vagrant 2.2.15'
#CURRENT_VAGRANT_VERSION = "$(vagrant --version)"
#if [ CURRENT_VAGRANT_VERSION neq EXPECTED_VAGRANT_VERSION ]; then
 #   echo 'The current version of Vagrant is :'
	#echo CURRENT_VAGRANT_VERSION
	#echo 'The expected version is :'
	#echo EXPECTED_VAGRANT_VERSION
	#echo 'Program exited with error code 1'
	#exit 1
#fi

# install libvirt to run vagrant/2
sudo apt -y install qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base qemu-utils qemu-system-x86
vagrant plugin install vagrant-libvirt
vagrant plugin install vagrant-mutate

# import bento/ubuntu-20.10 vagrant box and convert it to run with libvirt
vagrant box add --provider virtualbox bento/ubuntu-20.10
vagrant mutate bento/ubuntu-20.10 libvirt

# clone repository
cd
git clone https://github.com/vanessakovalsky/example-python.git

# access repository and launch vagrant virtual machine
cd example-python
#vagrant up --provider libvirt
#vagrant ssh

#python main.py
