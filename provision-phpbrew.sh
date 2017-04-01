#!/bin/bash

echo "installing phpbrew ..."

cd /home/vagrant/

echo "installing-phpbrew" > installing-phpbrew.txt

sudo apt-get build-dep -y php5
sudo apt-get install -y php5 php5-dev php-pear autoconf automake curl libcurl3-openssl-dev build-essential libxslt1-dev re2c libxml2 libxml2-dev php5-cli bison libbz2-dev libreadline-dev
sudo apt-get install -y libfreetype6 libfreetype6-dev libpng12-0 libpng12-dev libjpeg-dev libjpeg8-dev libjpeg8  libgd-dev libgd3 libxpm4 libltdl7 libltdl-dev
sudo apt-get install -y libssl-dev openssl
sudo apt-get install -y gettext libgettextpo-dev libgettextpo0
sudo apt-get install -y libicu-dev
sudo apt-get install -y libmhash-dev libmhash2
sudo apt-get install -y libmcrypt-dev libmcrypt4

curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew

# Move phpbrew to somewhere can be found by your $PATH
sudo mv phpbrew /usr/local/bin/phpbrew

sudo -u vagrant phpbrew init

if [ ! -d ".phpbrew/bin" ]; then
	mkdir -p .phpbrew/bin
fi

cd .phpbrew/bin

if [ -d "phpswap" ]; then
	cd phpswap
	git pull
else
    git clone https://gist.github.com/dd09556a5b4e800c8524208cce66579b.git phpswap
    cd phpswap
    sudo chmod a+x phpswap.sh
    sudo ln -s /home/vagrant/.phpbrew/bin/phpswap/phpswap.sh /usr/local/bin/phpswap
fi

cd /home/vagrant/

if [ ! -d ".phpbrew/php" ]; then
	mkdir -p .phpbrew/php
fi

cd .phpbrew/php
if [ ! -d "ini-custom" ]; then
	mkdir ini-custom
fi

cd ini-custom

if [ ! -f "all-versions.ini" ]; then
    printf "upload_max_filesize=1000M\npost_max_size=1000M" > "all-versions.ini"
fi