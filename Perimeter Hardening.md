**#Lock down ingress to servers
**#SSH, Admin Portals, FTP, Firewall, Services up



**###Disable root login for ssh (Haric Curtis)**

Edit: /etc/ssh/sshd_config

Change: PermitRootLogin yes

To: PermitRootLogin no

Run: service sshd restart


**###How to enable and set up Firewalld**

sudo systemctl start firewalld

firewall-cmd --permenant --zone=public --add-port=80/tcp

#If you need to set up a service run this instead

firewall-cmd --permanent --zone=public --add-service=http

#After you are done you then can enable firewalld

sudo systemctl enable firewalld


**###Change SSH port (Haric Curtis)**

Edit: /etc/ssh/sshd_config

Change: #Port 22

To: Port 4478

Run: service sshd restart

**#Public Key Authentication**

Enter: ~.ssh/

echo "" > authorized_keys

echo "" > id_rsa_pwn.pub
