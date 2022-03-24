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


# Checking Processes 
## Checking Process of Apache 
```
systemctl status apache2
systemctl status apache
```

## Checking users 
```
ps -ef 
ps -ejH
```

# Due to the scope of web servers i recommend reading up on this topic. Some critical items listed in an order of importance to look into are:
### PATCH
### Run apache, httpd, nginx as a non-priviledged user
### Disable directory browsing
### Disable Apache’s following of Symbolic Links
### Utilize mod_security for apache
### Enable Apache Logging
### Disable HTTP trace requests
### Limit request size
### Turn off Server Side Includes and CGI Execution
### Configure Listen ip / port explicitly (no 0.0.0.0)
#
#
#
#
#
#
# Mod Securiry 
### Step 1 
```
sudo apt install libapache2-mod-security2 -y
```
### Step 2 
```
sudo a2enmod headers
```
### Step 3
```
sudo systemctl restart apache2
```
### Step 4 
```
sudo cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
```
### Step 5
#### With a text editor such as vim, open ``` /etc/modsecurity/modsecurity.conf ``` and change the value for SecRuleEngine to On:
##### EXAMPLE:
```
# -- Rule engine initialization ----------------------------------------------

# Enable ModSecurity, attaching it to every transaction. Use detection
# only to start with, because that minimises the chances of post-installation
# disruption.
#
SecRuleEngine On
...
```
### Step 6 
```
sudo systemctl restart apache2
```
### Step 7 
#### OWASP
```
sudo rm -rf /usr/share/modsecurity-crs
```
### Step 8 
```
sudo apt install git
```
### Step 9
```
sudo git clone https://github.com/coreruleset/coreruleset /usr/share/modsecurity-crs
```
### Step 10
```
sudo mv /usr/share/modsecurity-crs/crs-setup.conf.example /usr/share/modsecurity-crs/crs-setup.conf
```
### Step 11
```
sudo mv /usr/share/modsecurity-crs/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example /usr/share/modsecurity-crs/rules/REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
```
### Step 12
#### Enabling ModSecurity in Apache 2
##### Using a text editor such as vim, edit the /etc/apache2/mods-available/security2.conf file to include the OWASP-CRS files you have downloaded:
###### EXAMPLE:
```
<IfModule security2_module>
        SecDataDir /var/cache/modsecurity
        Include /usr/share/modsecurity-crs/crs-setup.conf
        Include /usr/share/modsecurity-crs/rules/*.conf
</IfModule>
```
### Step 13
##### In /etc/apache2/sites-enabled/000-default.conf file VirtualHost block, include the SecRuleEngine directive set to On.
###### EXAMPLE:
```
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        SecRuleEngine On
</VirtualHost>
```
### Step 14
```
sudo systemctl restart apache2
```
### Step 15
#### Testing ModSecurity
```
curl http://<SERVER-IP/DOMAIN>/index.php?exec=/bin/bash
```
#
#
#
#
#
#
#
# Fail2Ban and apache
### Step 1
```
sudo apt-get update
sudo apt-get install fail2ban
```
### Step 2
```
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```
### Step 3
```
sudo nano /etc/fail2ban/jail.local
```
### Step 4
#### Ignore ip 
##### EXAMPLE:
```
/etc/fail2ban/jail.local
[DEFAULT]

. . .
ignoreip = 127.0.0.1/8 your_home_IP
```
#### Bantime 
##### EXAMPLE:
```
[DEFAULT]

. . .
bantime = 3600
```
#### Findtime/Maxretry
##### EXAMPLE:
```
[DEFAULT]

. . .
findtime = 3600   # These lines combine to ban clients that fail
maxretry = 6      # to authenticate 6 times within a half hour.
```
### Step 5
#### To enable log monitoring for Apache login attempts, we will enable the [apache] jail. Edit the enabled directive within this section so that it reads “true”:
##### EXAMPLE:
```
[apache]

enabled  = true
port     = http,https
filter   = apache-auth
logpath  = /var/log/apache/custom_log_location.log
maxretry = 3
findtime = 600
```
### Step 6 
#### Instide ```/etc/fail2ban/jail.local``` 
##### EXAMPLE:
```
[apache-noscript]

enabled  = true
. . .
```
### Step 7 
##### Example:
```
[apache-overflows]

enabled  = true
port     = http,https
filter   = apache-overflows
logpath  = /var/log/apache*/*error.log
maxretry = 2

[apache-badbots]

enabled  = true
port     = http,https
filter   = apache-badbots
logpath  = /var/log/apache*/*error.log
maxretry = 2

[apache-nohome]

enabled  = true
port     = http,https
filter   = apache-nohome
logpath  = /var/log/apache*/*error.log
maxretry = 2
```
### Step 8
#### IF TIME (PHP Protection)
##### EXAMPLE:
```
[php-url-fopen]

enabled = true
port    = http,https
filter  = php-url-fopen
logpath = /var/log/apache*/*access.log
```
### Step 9 
```
sudo service fail2ban restart
```
### Step 10
```
sudo fail2ban-client status
```
##### Example Output:
```
Output
Status
|- Number of jail:      7
`- Jail list:           php-url-fopen, apache-overflows, apache-noscript, ssh, apache-badbots, apache-nohome, apache
```
### Step 11
```
sudo iptables -S
```
### Step 12
```
sudo fail2ban-client status apache
```
### Step 13
```
sudo fail2ban-client status apache
```
#### UNBANNING IP'S 
```
sudo fail2ban-client set apache unbanip <ip goes here>
```





















