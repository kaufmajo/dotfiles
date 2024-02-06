#!/bin/bash

if [[ $(/etc/init.d/apache2 status | grep 'apache2 is running' | wc -l) > 0 ]]
then

    echo "Apache is currently running."

    sudo service apache2 stop
    sudo service apache2 start

else

    echo "Apache is not running."

    sudo service apache2 start
fi

if [[ $(/etc/init.d/mariadb status | grep 'mariadb is running' | wc -l) > 0 ]]
then

    echo "MariaDb is currently running."

    sudo service mariadb stop
    sudo service mariadb start

else

    echo "MariaDb is not running."

    sudo service mariadb start
fi