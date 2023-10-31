#!/bin/sh
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | apt-key add - # После пайпа sudo не убрано - а то не отработает добавление ключа
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sleep 30
apt-get update
sleep 30
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
