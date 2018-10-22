#!/bin/bash
bash /vagrant/provision/provision.sh

cd

echo "installing htop ..."
sudo apt-get install -y htop

echo "installing multitail ..."
sudo apt-get install -y multitail

echo "setting timezone ..."
sudo timedatectl set-timezone Europe/Berlin
sudo ntpdate -u ntp.ubuntu.com

echo "installing phing"
wget https://www.phing.info/get/phing-latest.phar
sudo mv phing-latest.phar /usr/local/bin/

sudo pear channel-update pear.php.net
sudo pear install -f VersionControl_SVN
sudo pear install Net_FTP
sudo pear install Services_Amazon_S3-0.4.0

sudo apt-get install -y pcregrep

echo "installing JRE"
# for using yui minimizer
sudo apt-get update
sudo apt-get install -y default-jre

sudo apt-get install -y language-pack-de
