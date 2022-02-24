#This is to open the sshd_config
sudo cat /etc/ssh/sshd_config
#Add this line in the 
AllowUsers "user"
AllowUsers "user"@"IP"
#Only the users on this "allowusers" included thing are then allowed to access through ssh
