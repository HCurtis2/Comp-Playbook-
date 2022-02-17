MARKDOWN SYNTAX

==============////////////////==============

https://www.markdownguide.org/cheat-sheet/

==============////////////////==============


# Lock down ingress to servers
# SSH, Admin Portals, FTP, Firewall, Services up



### Disable root login for ssh (Haric Curtis)

Edit: `/etc/ssh/sshd_config`

Change: `PermitRootLogin yes`

To: `PermitRootLogin no`

Run: `service sshd restart`

-----

### How to enable and set up Firewalld 

```bash
sudo systemctl start firewalld

firewall-cmd --permenant --zone=public --add-port=80/tcp

```

If you need to set up a service run this instead

```bash
firewall-cmd --permanent --zone=public --add-service=http
```

After you are done you then can enable firewalld

```bash
sudo systemctl enable firewalld
```

How to ban a specific IP with firewalld 

```bash
firewall-cmd --add-rich-rule='rule family=ipv4 source address=x.x.x.x reject' --permanent
```

-----

### Change SSH port (Haric Curtis)

Edit: `/etc/ssh/sshd_config`

Change: `#Port 22`

To: `Port 4478`

Run: `service sshd restart`

-----



### Remove existing SSH keys
This should be done for all users `/home/<user>/.ssh`

```bash
cd ~/.ssh/

rm *
```
Make sure to generate new keys and export the private key from the server. *DO NOT LEAVE THE PRIVATE KEY ON THE SERVER*

-----


### Remove packages that are not needed

`apt-get` or `yum`

```bash
yum remove <package>
```
```bash
apt-get remove <package>
```

#### This is another way of removing services if the yum remove does not work

```bash
rm /usr/bin/<binary-name>
```
IE: `/usr/bin/zsh`

-----



### #Disable passwordless root access to mysql

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




**##Using Ip Tables**
sudo apt-get install iptables

sudo apt-get install iptables-persistent

#Check status

sudo iptables -L

#Open Specific ports
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

#This is how you ban an IP when using IP tables
iptables -A INPUT -s XXX.XXX.XXX.XXX -j DROP

#For Debian Baseds systems
sudo /sbin/iptables–save

#For Red-hat Systems
sudo /sbin/service iptables save

#Save your settings
service iptables save
