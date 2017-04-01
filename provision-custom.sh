#!/bin/bash
bash /vagrant/provision/provision.sh

sudo apt-get install language-pack-de

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
fi

echo "installing htop ..."
sudo apt-get install -y htop

echo "installing multitail ..."
sudo apt-get install -y multitail

echo "setting timezone ..."
sudo timedatectl set-timezone Europe/Berlin
sudo ntpdate -u ntp.ubuntu.com

