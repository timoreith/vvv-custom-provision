#!/bin/bash
bash /vagrant/provision/provision.sh

echo "installing oh-my-zsh ..."

sudo apt-get install -y zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
cp -f /home/vagrant/.zshrc /home/vagrant/.zshrc.orig
cp -f /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
sudo chsh -s /bin/zsh vagrant
zsh

cd /home/vagrant/.oh-my-zsh/custom/
if [ -d "my" ]; then
	cd my
	git pull
else
	git clone https://github.com/timoreith/ohmyzsh-custom.git my
	ln -s /home/vagrant/.oh-my-zsh/custom/my/theme.zsh theme.zsh
	ln -s /home/vagrant/.oh-my-zsh/custom/my/plugins.zsh plugins.zsh
	ln -s /home/vagrant/.oh-my-zsh/custom/my/aliases.zsh aliases.zsh
	ln -s /home/vagrant/.oh-my-zsh/custom/my/phpbrew.zsh phpbrew.zsh
fi

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

sudo apt-get install -y pcregrep

echo "installing JRE"
# for using yui minimizer
sudo apt-get update
sudo apt-get install -y default-jre

sudo apt-get install -y language-pack-de
