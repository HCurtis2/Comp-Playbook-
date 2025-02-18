# fail2ban on CentOS

```bash
yum install epel-release
yum install fail2ban fail2ban-systemd
yum update -y selinux-policy*
cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
vim /etc/fail2ban/jail.local
```

#Inside jail.local
 #Ignoreip: Selects the list of IP addresses that will not be banned.
 #Ban: Determines the duration in seconds during which a host is banned after a number of failed attempts.
 #Findtime: This is the parameter used for checking if a host is banned or not. When a host generates maxretry in its last findtime, it is banned.
 #Maxretry: This parameter sets the limit for the number of retries by a host. If the limit is exceeded, the host is banned.

Edit `sshd.local`
```bash
vim /etc/fail2ban/jail.d/sshd.local
```

```ini
  [sshd]
  enabled = true
  port = ssh
  #action = firewallcmd-ipset
  logpath = %(sshd_log)s
  maxretry = 5
  bantime = 86400
```

```bash
systemctl enable firewalld
systemctl start firewalld
systemctl enable fail2ban
systemctl start fail2ban
```

#Tracking Failed login attempts
cat /var/log/secure | grep 'Failed password'

#To get the list of banned IP addresses run
iptables -L -n

#To check the status of jail bans run
fail2ban-client status



#fail2ban on Ubuntu
sudo apt update
sudo apt install fail2ban
sudo systemctl status fail2ban

sudo cp /etc/fail2ban/jail.{conf,local}
sudo nano /etc/fail2ban/jail.local


#Whitelist IP Addresses
#IP addresses, IP ranges, or hosts that you want to exclude from banning can be added to the ignoreip directive. 
#Here you should add your local PC IP address and all other machines that you want to whitelist.
#Uncomment the line starting with ignoreip and add your IP addresses separated by space:
/etc/fail2ban/jail.local
ignoreip = 127.0.0.1/8 ::1 123.123.123.123 192.168.1.0/24

#Ban Settings 
#The values of bantime, findtime, and maxretry options define the ban time and ban conditions.
bantime is the duration for which the IP is banned. When no suffix is specified, it defaults to seconds. 
#By default, the bantime value is set to 10 minutes. Generally, most users will want to set a longer ban time. Change the value to your liking:
/etc/fail2ban/jail.local
#bantime  = 1d
#To permanently ban the IP use a negative number.
#findtime is the duration between the number of failures before a ban is set. 
#For example, if Fail2ban is set to ban an IP after five failures (maxretry, see below), those failures must occur within the findtime duration.
#findtime  = 10m
#maxretry is the number of failures before an IP is banned. The default value is set to five, which should be fine for most users.
/etc/fail2ban/jail.local
#maxretry = 5

#Fail2ban Jails
#Fail2ban uses a concept of jails. A jail describes a service and includes filters and actions. 
#Log entries matching the search pattern are counted, and when a predefined condition is met, the corresponding actions are executed.
#Fail2ban ships with a number of jail for different services. 
#You can also create your own jail configurations.
#By default, only the ssh jail is enabled. To enable a jail, you need to add enabled = true after the jail title. 
#The following example shows how to enable the proftpd jail
#Inside jail.local
[proftpd]
enabled  = true
port     = ftp,ftp-data,ftps,ftps-data
logpath  = %(proftpd_log)s
backend  = %(proftpd_backend)s

#The settings we discussed in the previous section, can be set per jail. Here is an example:
#Inside jail.local
/etc/fail2ban/jail.local
[sshd]
enabled   = true
maxretry  = 3
findtime  = 1d
bantime   = 4w
ignoreip  = 127.0.0.1/8 23.34.45.56

#The filters are located in the /etc/fail2ban/filter.d directory, stored in a file with the same name as the jail. 
#If you have a custom setup and experience with regular expressions, you can fine-tune the filters.
#Each time you edit a configuration file, you need to restart the Fail2ban service for changes to take effect
sudo systemctl restart fail2ban

#Fail2ban Client
#Fail2ban ships with a command-line tool named fail2ban-client which you can use to interact with the Fail2ban service.
#To view all available options, invoke the command with the -h option:
fail2ban-client -h
#Check the jail status:
sudo fail2ban-client status sshd

#Unban an IP:
sudo fail2ban-client set sshd unbanip {ip goes here}

#Ban an IP:
sudo fail2ban-client set sshd banip {ip goes here}




Add to document SAM {apache with fail2ban}
https://www.digitalocean.com/community/tutorials/how-to-protect-an-apache-server-with-fail2ban-on-ubuntu-14-04
