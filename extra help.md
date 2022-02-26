How do you list users on a linux system?
/etc/passwd
# you then can view all the users in your system

How do you check the password hashing algorithm used for a user's password?
#not sure if this is what your asking but the order of it is the id, salt, password once in etc/shadow
# shadow shows the hashes
/etc/shadow 

How do you add / remove users?
#remove
Userdel “user” 
#add
Useradd “user” 

How do you add / remove groups
#addgroup
groupadd “group name”

#remove group
groupdel “group name” 

How do you add / remove a user to a group or groups?

#add user 
usermod -a “group name” “user want to add” 
# do the flags after usermod 
# -G means secondary group 
# -g primary group 

#remove user from group 
gpasswd -d “user” “user group”

How do you change a password?
passwd “user” 
#will ask to verify your old password and require new password twice 

What are two ways to check permissions of a file?
ls -l “file” 
stat "file"
#change permissions 
Chmod “numbers” “file”
#read 4, write 2, execute 1, Add them up to get you permission. First set of numbers is user then group then others so 777 is everyone has full permissions. 

How do you check open/listening ports on a linux system locally?
netstat
ss
#check open ports with iptables 
iptables -L 

How do you kill a terminal / ssh session that you did not start?

pstree

#then look for the ssh session or whatever session you want to close and you can then type this
#keep not of your session so you don't accidentally delete it like a dumb

kill "session number"

How do you transfer files between linux boxes and / or windows and linux boxes from command line? 

I can never do this right 

Why are pre-existing ssh keys dangerous? Because they can be reused or used later down the line if they are never terminated/removed. 

How do you manually set an IP address on linux? I get this like half the time 

ifconfig etho0 "ip address you want to change to" 


