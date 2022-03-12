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


