### Centos 7 Groups and Users
userdel "user" 

useradd "user" 


sudo groupadd "groupname"
usermod -a -G "groupname' username

groupdel "groupname"

# Check Users/Roll passwords
cd /etc/passwd

output ex: root:x:0:0:root:/root:/bin/bash

first line: Username

second line: Encrypted Password

x = Password Stored in /etc/shadow

third line: User ID Number (UID)

fourth line: User's Group ID number (GID)

fifth line: Full Name of User (GECOS)

sixth line: Home Directory

seventh line: Login Shell

Default = /bin/bash
## List only user names
awk -F: '{ print $1}' /etc/passwd
## cross check the users that should be there normally. Some will be in the beginning users but most will be towards the end of the etc/passwd file
passwd "username" 
### cross off the passwords from the list when you have to change the passwords. IE for admin users and things like that. 


# Change Hashing algorithm
/etc/pam.d

sudo vim common-password
### in the vim change your per package modules to below that way it keeps a sha 256 algorithm
password  [success=1 default=ignore] pam_unix.so obscure sha256
#### this will have it so whenever a new user is made it will have this password hashing alogrithm. We will have to change current user passwords because it will not do it automatically. 

### Types of hash hardening. 
$1$ is MD5
$2a$ is Blowfish
$2y$ is Blowfish
$5$ is SHA-256
$6$ is SHA-512

