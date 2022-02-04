

**#Change Root Password**

sudo passwd root

**#Update your services**




**#How to create a pkill command/script when going through this script just change the command name**

Enter: /tmp

sudo vim zsh.sh

#!/bin/bash
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \" '"$USER"' Tried to run zsh shell on '"$HOSTNAME"' \"}" NEED A UPDATED LINK HERE >/dev/null 2>/dev/null

sudo apt-get install shc

shc -f zsh.sh

#zsh.x will be a binary

mv zsh.sh.x /usr/bin/zsh

chmod 701 /usr/bin/zsh

**#Removing Uneeded Users. Our systems will come with a large amount of uneeded users**

sudo cat /etc/passwd  

userdel -r mynewuser

**#Allow only certain users to SSH logins**

cd /etc/ssh

vim sshd_config

AllowUsers blueteam scorecheck01 scorecheck02 scorecheck03 greenteam02

service sshd restart
