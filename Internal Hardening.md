

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

## Installing a lse.sh and checking everything that is wrong with it 

wget "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh" -O lse.sh;chmod 700 lse.sh

sudo lse.sh
### Copy the output and save locally on your machine and make sure to delete the lse.sh when you are done with it. ADDITIONALLY MAKE SURE TO DELETE YOUR HISTORY CONSTANTLY 
