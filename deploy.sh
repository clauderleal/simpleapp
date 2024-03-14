#!/usr/bin/env bash
sudo apt update && sudo apt install nodejs npm
# install pm2 which ins a production process manager for node
sudo npm install -g pm2
# stop any instance of our app running currently
pm2 stop simpleapp
# change directory into folder where application is downloaded
cd simpleapp
# install application dependencies
npm cache clean -f
npm install -g n
sudo n stable
npm install truffle
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt
# start application
pm2 start ./bin/www --name simpleapp