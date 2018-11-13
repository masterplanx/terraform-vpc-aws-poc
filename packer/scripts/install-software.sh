#!/bin/bash
sleep 30
sudo apt update
#sudo apt -y upgrade
sudo apt install -y build-essential python-dev python python-software-properties python-pip
sudo pip install --upgrade pip
sudo apt-get install -y nginx
