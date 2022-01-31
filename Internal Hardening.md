

**#Change Root Password**

sudo passwd root


**#How to create a pkill command/script when going through this script just change the command name**

Enter: /tmp

sudo vim zsh.sh

#!/bin/bash
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \" '"$USER"' Tried to run zsh shell on '"$HOSTNAME"' \"}" NEED A UPDATED LINK HERE >/dev/null 2>/dev/null

sudo apt-get install shc

shc -f zsh.sh

#zsh.x will be a binary

mv zsh.sh.x /usr/bin/zsh

chmod 701 /usr/bin/zsh


