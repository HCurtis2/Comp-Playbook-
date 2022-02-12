#!/bin/bash

#Watch command if output isnt MASSIVE - watch -n1 /var/log/faillog.1
#Watch Command if output is wrong - watch -n1 tail -10 /var/log/faillog.1

#Directories we are watching - (/usr /tmp /etc /var /$PATH)

find /usr/local/sbin /usr/local/bin /usr/bin /usr/sbin /sbin /bin /usr/local/games /usr/games /tmp /etc /var -not -path "/var/log/*" -not -path "/var/lib/NetworkManager/timestamps" -type f -exec md5sum '{}' \;> /var/log/messages.3

#Infanent Loop
for (( ; ; ))
do

#Checks against the checksums created above.   
        sudo md5sum -c messages.3 > messages.4 


#Tells user id there is an error and sends to a log file
        date >> /var/log/faillog.1
        cat messages.4 | grep "FAILED" >> /var/log/faillog.1

#CTRL+C to kill the program
        echo -e "\nHit [CTRL+C] to kill the program or it will run again in 30 Seconds\n\n";

#Sleeps the program for 30 seconds and then runs again 
        sleep 30

done 
