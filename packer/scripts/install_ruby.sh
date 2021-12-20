#!/bin/bash
printf "Ruby and Bundler: installing ...\n"
apt update
apt install -y ruby-full ruby-bundler build-essential
printf "\nRuby and Bundler: successfully installed.\n"
