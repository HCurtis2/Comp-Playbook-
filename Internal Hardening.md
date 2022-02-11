

**#Change Root Password**

sudo passwd root

**#Update your services**

sudo apt update


**#Removing Uneeded Users. Our systems will come with a large amount of uneeded users**

sudo cat /etc/passwd  

userdel -r mynewuser

**#Allow only certain users to SSH logins**

cd /etc/ssh

vim sshd_config

AllowUsers blueteam scorecheck01 scorecheck02 scorecheck03 greenteam02

service sshd restart
