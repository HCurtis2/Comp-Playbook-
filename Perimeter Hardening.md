# Lock down ingress to servers
# SSH, Admin Portals, FTP, Firewall, Services up



### Disable root login for ssh (Haric Curtis)

Edit: /etc/ssh/sshd_config

Change: PermitRootLogin yes

To: PermitRootLogin no

Run: service sshd restart



### How to enable and set up Firewalld 

sudo systemctl start firewalld

firewall-cmd --permenant --zone=public --add-port=80/tcp

If you need to set up a service run this instead

firewall-cmd --permanent --zone=public --add-service=http

After you are done you then can enable firewalld

sudo systemctl enable firewalld

#How to ban a specific IP with firewalld 

firewall-cmd --add-rich-rule='rule family=ipv4 source address=x.x.x.x reject' --permanent



### Change SSH port (Haric Curtis)

Edit: /etc/ssh/sshd_config

Change: #Port 22

To: Port 4478

Run: service sshd restart



**#Public Key Authentication**

Enter: ~.ssh/

echo "" > authorized_keys

echo "" > id_rsa_pwn.pub


**#Remove services you aren't usring such as tmux**

yum remove tmux

#This is another way of removing services if the yum remove does not work

rm /usr/bin/zsh 




**#Disable passwordless root access to mysql**

mysql_secure_installation

Set root password? y

Remove anonymous users? y

Disallow root login remotely? y

Remove test database and access to it? y

Reload privilege tables now? y

**#Disable anonymous FTP**

cd /etc/vsftpd

vim vsftpd.conf

Change: anonymous_enable=YES

To: anonymous_enable=NO

service vsftpd restart


**#Disable anonymous FTP upload**

cd /etc/vsftpd

vim vsftpd.conf

Change: anon_upload_enable=YES

To: anon_upload_enable=NO



Change: anon_mkdir_write_enable=YES

To: anon_mkdir_write_enable=NO

service vsftpd restart




***#Using Ip Tables**
#This is how you ban an IP when using IP tables
iptables -A INPUT -s XXX.XXX.XXX.XXX -j DROP

#How to check status/rules of your iptables status 
sudo iptables -S
