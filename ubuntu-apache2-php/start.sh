#!/bin/sh

/usr/bin/supervisord

if [ $1 != "" ]; then
        mysql -u root -e "create database phpipam;"
        mysql -u root -e "grant all on phpipam.* to phpipam@localhost identified by '$1';"
fi

