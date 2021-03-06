#!/bin/bash
#change hostname machine without restart
echo "testy" > /etc/hostname
#in case where 127.0.1.1 is already set to ubuntu
sed -i 's/ubuntu/testy/g' /etc/hosts 
#in case where 127.0.1.1 is not set
#sed -i '2i 127.0.1.1 testy' /etc/hosts
hostnamectl set-hostname testy
exec bash

###########################
#increment the last number of the name exp student1 becomes student2
############################

#!/bin/bash
OLDNAME=$(hostname)
OLDNUM=$(hostname | grep -Eo '[[:digit:]]+')
NEWNUM=$((OLDNUM+1))
NEWNAME=$(echo ${OLDNAME/$OLDNUM/$NEWNUM})
echo $NEWNAME > /etc/hostname
#in case where 127.0.1.1 is already set
sed -i "s/$OLDNAME/$NEWNAME/g" /etc/hosts
#in case where 127.0.1.1 is not set
#sed -i "2i 127.0.1.1 $NEWNAME" /etc/hosts
hostnamectl set-hostname $NEWNAME
exec bash
