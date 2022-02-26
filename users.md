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
### cross off the passwords from the list when you have to change the passwords. IE for admin users and things like that. 


# Change Hashing algorithm
/etc/pam.d

sudo vim common-password
### in the vim change your per package modules to below that way it keeps a sha 256 algorithm
password  [success=1 default=ignore] pam_unix.so obscure sha256



