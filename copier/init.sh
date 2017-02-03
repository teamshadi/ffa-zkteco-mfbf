#!/bin/bash

cp /etc/ffa-zkteco-mfbf-copier-odbc/odbc.ini /etc/
cp /etc/ffa-zkteco-mfbf-copier-odbc/odbcinst.ini /etc/
envsubst < ./etc/apache2/copier.conf > /etc/apache2/sites-available/copier.conf
if [ ! -f /etc/apache2/sites-enabled/copier.conf ]; then
  ln -s /etc/apache2/sites-available/copier.conf /etc/apache2/sites-enabled/copier.conf
fi
service apache2 start
nats --server ${UPDATER_NATSURI} sub foo --cmd "php bin/natsListener.php" --token "help me"
