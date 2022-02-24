# Give Root Permission to users 
## Go to /etc
```
cd /etc
```
## Run ```ls -l``` to determine if sudoers is read only
### If sudoers is read only run:
```
sudo chmod +x sudoers 
```
## Enter sudoers with a text editor
```
sudo <vi/vim/nano> sudoers
```

## Locate "User privilege specification"
### An example of a full sudo user is [root] & [debian]
```
root    ALL=(ALL:ALL) ALL
debian  ALL=(ALL:ALL) ALL
```

## Giving a user access to specific commands 
### Allow the user to run only specific commands via sudo. For example, to allow only the mkdir and rmdir commands you would use:
```
username ALL=(ALL) :/bin/mkdir,/bin/rmdir
```

## Make sure to change sudoers back to read only with this command:
```
sudo chmod 440 sudoers 
```
