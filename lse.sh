##  lse.sh
Linux Simple Enumeration is a tool to... enumerate linux. This script will show potentially dangerous misonfigurations and other system details. 

Download and chmod the script.
```bash
wget "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh" -O lse.sh;chmod 700 lse.sh
```
Run lse with the most verbose setting. Manually set what items to enumerate excluding the networking component and `/var/lib/docker` directory if it exists. Output this information to the terminal and write it to lse-[HOSTNAME].out
```bash
./lse.sh -l 2 -s ctn,sof,srv,ret,sec,sys,fst,sud,usr -c -i -e /var/lib/docker | tee lse-$(hostname).out
```
Changing lse.sh permissions.
```
chmod +x lse.sh
```
lse.sh execution
```
sudo ./lse.sh
```
> Potential backup download https://web.archive.org/web/20220305230914/https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh
