DEPRECATED FILE



# Requirements

## Pre
```bash
    sudo apt-get update
    sudo apt-get install php5 php5-dev php-pear libyaml-dev php5-mongo mdbtools unixodbc-dev
    sudo pecl install yaml
```
* if the pecl install above fails, install php 5.6 instead of 5.5.9

```bash
    sudo add-apt-repository ppa:ondrej/php5-5.6 # php 5.5.9 was not letting me install yaml via pecl install yaml
```

## ffa-mfe

* follow installation instructions of ffa-mfe and run tests to make sure installation is ok
* follow installation instructions of ffa-mfe/databases-api and run tests to make sure installation is ok

## Apache

* sudo apt-get install libapache2-mod-php5 
* copy etc/apache2/sites-available/ffa-mfe/fingerprints-adapter-sample.conf /etc/apache2/sites-available/ffa-mfe
** edit as needed
* edit /etc/apache2/sites-available/ffa-mfe.conf to include this file
* sudo service apache2 restart

## mySql

```bash
    sudo apt-get install mysql-server php5-odbc unixodbc libmyodbc freetds-dev tdsodbc # freetds-bin  unixodbc-dev
    cp shadi-configs/ffa20/etc/odbc.ini and odbcinst.ini to /etc/odbc.ini and /etc/odbcinst.ini
    # check that the shared object libararies are referenced from the Driver fields in `/etc/odbc.ini` (check below) and `/etc/odbcinst.ini`
    # Could run the below `ln -s` (not necessarily) and use the shorter paths in the ini files above
    sudo ln -s /usr/lib/i386-linux-gnu/odbc/libmyodbc.so /usr/lib/odbc/
    sudo ln -s /usr/lib/i386-linux-gnu/odbc/libtdsodbc.so /usr/lib/odbc/
```

* create tables using scripts/createTables.sql
* add user and create tables following scripts/createTables.sql
** same using scripts/createTablesMarketflow.sql on the Marketflow database (once for lebanon and once for dubai)

## crontab

* sudo crontab: `mount -a` is needed on @reboot, a remount.sh call can be run every hour to remount if the mount is lost
* crontab of user: test_01_fingerprints.sh every hour + update.sh every few minutes

# Configure

* copy config-sample.sh to config.sh and set the variables properly
* note that the path to the access database (in mdbf2 variable) requires mounting the windows share

```bash
    sudo mkdir /mnt/fingerprints
    # add the relevant line in /etc/fstab
    sudo mount -a
```

* also copy config-sample.php to config.php

# Troubleshooting

* if ffa-mfe is installed in /etc/ffa-mfe, then  make sure to chown shadi:shadi /etc/ffa-mfe
* if ffa-mfe is installed in /home/shadi, then make sure that the home directories are not encrypted upon logout

