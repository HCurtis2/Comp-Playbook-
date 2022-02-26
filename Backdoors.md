cat /.ssh/authorized_keys

# check this to see when files are motified
'ls --full-time'

# find some suid bits
'find .'

# Check how many sessions are open with the last 
'who'
'w'
'last | grep still'

# To find active users on a ssh port for example
'netstat | grep ssh'
'ss -a | grep ssh' 
## Make sure to make note of these that are open and listening prior to the attack 

