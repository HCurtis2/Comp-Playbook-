 
sudo vim /etc/httpd/conf/httpd.conf (RHEL/CentOS/Fedora)
### Change these in the config file
`ServerSignature Off`
`ServerTokens Prod`
### Change these in the config file
<Directory /var/www/html>
  Options -Indexes
</Directory>
