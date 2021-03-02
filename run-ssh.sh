#!/bin/sh

# make sure ssh is running
# if it isn't running, you'll be prompted to enter your password
service ssh status | grep "is running" > /dev/null
if [ $? -gt 0 ]
then
    sudo service ssh start
fi

# return the IP address of the instance
ifconfig eth0 | grep 'inet\ ' | head -1 | awk '{print $2}'
