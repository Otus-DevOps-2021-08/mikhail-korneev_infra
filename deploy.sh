#!/bin/bash
printf "Deploy: installing git ...\n"
sudo apt install git
git --version

printf "Deploy: cloning source code ...\n"
git clone -b monolith https://github.com/express42/reddit.git

printf "Deploy: installing dependencies ...\n"
cd reddit && bundle install

printf "Deploy: running server ...\n"
puma -d
ps aux | grep puma
