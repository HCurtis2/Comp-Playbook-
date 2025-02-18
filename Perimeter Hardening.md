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

list all open port numbers 

sudo firewall-cmd --list-all

sudo firewall-cmd --reload

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
### Installing mysql server

sudo apt install mysql-server

### Disable passwordless root access to mysql

'''mysql_secure_installation

Set root password? y

Remove anonymous users? y

Disallow root login remotely? y

Remove test database and access to it? y

Reload privilege tables now? y
'''
----
### Mysql Password Setup
 After disabling passwordless root access to mysql
 
VALIDATE PASSWORD PLUGIN can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD plugin?

Press y|Y for Yes, any other key for No:  Press 'y'

Password Configurations:
There are three levels of password validation policy:

LOW    Length >= 8
MEDIUM Length >= 8, numeric, mixed case, and special characters
STRONG Length >= 8, numeric, mixed case, special characters and dictionary file

Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 1

MUST choose 1

----

**#Disable anonymous FTP**

cd /etc/vsftpd

vim vsftpd.conf

Change: anonymous_enable=YES

To: anonymous_enable=NO

service vsftpd restart

----
**#Disable anonymous FTP upload**

cd /etc/vsftpd

vim vsftpd.conf

Change: anon_upload_enable=YES

To: anon_upload_enable=NO


----
Change: anon_mkdir_write_enable=YES

To: anon_mkdir_write_enable=NO

service vsftpd restart



----
# Using Ip Tables

'''sudo apt-get install iptables

sudo apt-get install iptables-persistent'''

### Check status

'''sudo iptables -L'''

### How to delete a port after checking status

sudo iptables -D INPUT 3

### Open Specific ports

sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

### This is how you ban an IP when using IP tables

iptables -A INPUT -s XXX.XXX.XXX.XXX -j DROP

#### For Debian Baseds systems

sudo /sbin/iptables–save

#### For Red-hat Systems

sudo /sbin/service iptables save

#### Save your settings

service iptables save


# Changing IP ports sudo ufw allow "port #"

### For a port range use the command 

sudo ufw allow #:#

sudo ufw enable sudo ufw reload

sudo ufw deny #:#

------
# Installing and Configuring an Nginx Server

sudo apt update

sudo apt install nginx

sudo ufw 80/tcp

sudo ufw status |  -verification

ip a | -IPV4 Address 2nd Adapter: 'inet'
  
go to web browser |  -http://[ip address from inet]
  
should show Nginx webpage

systemctl status nginx |  -verification of server working

-----

### Configuring Nginx to Use the PHP

sudo apt install php-fpm php-mysql

sudo mkdir /var/www/your_domain

sudo chown -R $USER:$USER /var/www/your_domain

sudo nano /etc/nginx/sites-available/your_domain

 server {
    listen 80;
    server_name your_domain www.your_domain;
    root /var/www/your_domain;

    index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
     }

    location ~ /\.ht {
        deny all;
    }

}

sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled

sudo unlink /etc/nginx/sites-enabled/default

sudo nginx -t: |  Configuration Test

sudo systemctl reload nginx: |  Reload nginx


# Apache Install on Ubuntu 
## Step #1
```
sudo apt-get update
sudo apt-get install apache2
```

## Step #2: [Verify Apache Installation]
### In web browser 
```
http://local.server.ip
```
### Note: Replace local.server.ip with the IP address of your server. If you are unsure what's the IP address, run the following terminal command: 
```
hostname -I | awk '{print $1}'
```

## Step #3: [Configure Your Firewall]
```
sudo ufw app list
```
### The terminal should respond by listing all available application profiles, as seen in the example below.
```
Available applications:
 Apache
 Apache Full
 Apache Secure
 OpenSSH
```
### Use the following command to allow normal web traffic on port 80:
```
sudo ufw allow 'Apache'
```
### Verify the changes by checking UFW status:
```
sudo ufw status
```
#### If you have other applications or services to allow, make sure you configure your firewall to allow traffic. For example, using the ``` sudo ufw allow 'OpenSSH' ``` command will enable secure, encrypted logins over the network.

### If ``` sudo ufw status ``` shows ``` Status: inactive ``` then run:
```
sudo ufw enable
```
### Then try ``` sudo ufw status ``` again

# Apache Configuration
## Apache Service Controls
### Stop Apache:
```
sudo systemctl stop apache2.service
```
### Start Apache:
```
sudo systemctl start apache2.service
```
### Restart Apache:
```
sudo systemctl restart apache2.service
```
### Reload Apache:
```
sudo systemctl reload apache2.service
```

# Apache Configuration Files
## List of essential directories:

### Website content is stored in ```/var/www/html/directory ```

### Apache creates log files for any errors it generates in the file ``` /var/log/apache2/error.log ```

### It also creates access logs for its interactions with clients in the file ``` /var/log/apache2/access.log ```

### Like many Linux-based applications, Apache functions through the use of configuration files. They are all located in the ``` /etc/apache2/ directory ```

### ``` /etc/apache2/apache2.conf ``` – This is the main Apache configuration file and controls everything Apache does on your system. Changes here affect all the websites hosted on this machine.

### ``` /etc/apache2/ports.conf ``` – The port configuration file. You can customize the ports Apache monitors using this file. By default, Port 80 is configured for http traffic.

### ``` /etc/apache2/sites-available ``` – Storage for Apache virtual host files. A virtual host is a record of one of the websites hosted on the server.

### ``` /etc/apache2/sites-enabled ``` – This directory holds websites that are ready to serve clients. The a2ensite command is used on a virtual host file in the sites-available directory to add sites to this location.

# ModSecurity
## Step #1: Installation
```
sudo apt-get update
sudo apt install libapache2-mod-security2 -y
sudo a2enmod headers
sudo systemctl restart apache2
```

## Step #2: Configuration
### Remove .recommended extenstion from ModSecurity config file
```
 sudo cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
```
### With a text editor such as vim, open /etc/modsecurity/modsecurity.conf and change the value for SecRuleEngine to On: 
```
# -- Rule engine initialization ----------------------------------------------

# Enable ModSecurity, attaching it to every transaction. Use detection
# only to start with, because that minimises the chances of post-installation
# disruption.
#
SecRuleEngine On
...

sudo systemctl restart apache2
```

## Step #3: Setting Up OWASP ModSecurity Core Rule Set
# Delete current rule set that comes with prepackaged with ModSecurity by running the following command:
```
sudo rm -rf /usr/share/modsecurity-crs
```
# Install modsecurity git
```
sudo apt install git
```
# Clone the OWASP-CRS GitHub repository into the /usr/share/modsecurity-crs directory:
```
sudo git clone https://github.com/coreruleset/coreruleset /usr/share/modsecurity-crs
```
# Rename the crs-setup.conf.example to crs-setup.conf:
```
sudo mv /usr/share/modsecurity-crs/crs-setup.conf.example /usr/share/modsecurity-crs/crs-setup.conf
```
# Rename the default request exclusion rule file:
```
sudo mv /usr/share/modsecurity-crs/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example /usr/share/modsecurity-crs/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
```

## Step # 4: Enabling ModSecurity in Apache 2
# Using a text editor such as vim, edit the /etc/apache2/mods-available/security2.conf file to include the OWASP-CRS files downloaded:
```
File: /etc/apache2/mods-available/security2.conf

<IfModule security2_module>
        SecDataDir /var/cache/modsecurity
        Include /usr/share/modsecurity-crs/crs-setup.conf
        Include /usr/share/modsecurity-crs/rules/*.conf
</IfModule>

```
# In /etc/apache2/sites-enabled/000-default.conf file VirtualHost block, include the SecRuleEngine directive set to On.
```
File: /etc/apache2/sites-enabled/000-default.conf

<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        SecRuleEngine On
</VirtualHost>

sudo systemctl restart apache2 
```


# Glossary
### UFW – Uncomplicated Firewall, a software application that blocks network traffic (usually for security)
### SSH – Secure Shell, used for encrypted logins over a network
### APT – Ubuntu’s default package manager, used for installing and updating software packages
### GUI – Graphical User Interface – the “point and click” interface of the operating system




