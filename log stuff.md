# Authentication Logs/ Syslog 

CentOS `/var/log/secure` valid login example.

```shell
Dec  6 12:00:00 <HOSTNAME> sshd[1509387]: Accepted password for root from <CONNECTING HOST> port 31273 ssh2
Dec  6 12:00:00 <HOSTNAME> sshd[1509387]: pam_unix(sshd:session): session opened for user root by (uid=0)

```

Ubuntu `/var/log/auth.log` valid login example.

```shell
Dec  6 12:00:00 <HOSTNAME> sshd[1146601]: Accepted password for root from <CONNECTING HOST> port 1181 ssh2
Dec  6 12:00:00 <HOSTNAME> sshd[1146601]: pam_unix(sshd:session): session opened for user root by (uid=0)
```
As you can see they are the same.

To be able to see all of your logs type the following commands
```
less /var/log/auth.log
```
To find specific words or specific commands that were used use the following
```
grep "root" less /var/log/auth.log 
```

If you only know a part of a word you can run the following command

```
grep "r**t" less /var/log/auth.log 

```
The * act as a "Wildcard" and they can act as any letter or number. 
