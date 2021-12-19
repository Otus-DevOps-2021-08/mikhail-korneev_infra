#!/bin/bash
printf "MongoDB: installing ...\n"

printf "MongoDB: adding keys and repository ...\n"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list

printf "MongoDB: installing packages ...\n"
apt update
apt install -y mongodb-org

printf "MongoDB: running service ...\n"
systemctl start mongod
printf "MongoDB: enable autostart ...\n"
systemctl enable mongod

printf "MongoDB: successfully installed ...\n"
systemctl status mongod
