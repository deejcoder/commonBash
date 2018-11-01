#!/bin/bash

if [ -z "$1" ]
then
        echo "ERROR: you must supply a username for the user."
        exit
fi


USER=$1
KEY="${@:2}"
useradd -m -d /home/users/$USER -s /bin/bash -U $USER
mkdir -p /home/users/$USER/.ssh
echo $KEY >> /home/users/$USER/.ssh/authorized_keys
chown $USER:$USER -R /home/users/$USER
chmod 770 -R /home/users/$USER
chmod 755 -R /home/users/$USER/.ssh
echo "User has been created. To set permissions use usermod -aG [role] [user]"