#!/bin/bash

cd /srv/www/wordpress-develop/public_html/src/wp-content/plugins/

ln -s /vagrant/share/sources/amazonsimpleadmin/trunk amazonsimpleadmin
ln -s /vagrant/share/sources/amazon-simple-affiliate/trunk/amazon-simple-affiliate amazon-simple-affiliate
ln -s /vagrant/share/sources/post-status-notifier/trunk/post-status-notifier post-status-notifier
