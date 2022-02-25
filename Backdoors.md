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
## Make sure to make note of these thta are open and listening prior to the attack 

1) they change something or notify you via inject
2) you see a new shell open when you use the who or last | grep still or w command 
3) you see an active network socket for you ssh port netstat | grep ssh or ss -a | grep ssh
