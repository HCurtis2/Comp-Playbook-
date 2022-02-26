### Centos 7 Groups and Users
userdel "user" 

useradd "user" 


sudo groupadd "groupname"
usermod -a -G "groupname' username

groupdel "groupname"


# Check Users/Roll passwords
cd /etc/passwd
## cross check the users that should be there normally. Some will be in the beginning users but most will be towards the end of the etc/passwd file
passwd "username" 




