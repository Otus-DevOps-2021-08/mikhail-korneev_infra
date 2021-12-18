#!/bin/bash
printf "Ruby and Bundler: installing ...\n"
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

printf "\nRuby and Bundler: successfully installed.\n"
ruby -v
bundler -v
