# Install script for bot-bashd

if [[ $(id -u) -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# deploy files
cp -dR system/etc/* /etc/
cp -dR system/usr/* /usr/

# make bot-bash
cd /usr/local/bin/bot-bash
npm install
cd -

# fix permissions
chown root:staff    /etc/init.d/bot-bashd
chown root:staff    /usr/sbin/bot-bashd
chown root:staff    /usr/local/bin/bot-bash
chown -R root:staff /usr/local/src/bot-bash

#install/update bot-bash service
update-rc.d bot-bashd defaults 97 03