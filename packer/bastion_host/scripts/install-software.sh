#!/bin/bash
sleep 30
sudo apt update
sudo apt install -y build-essential python-dev python python-software-properties python-pip
sudo apt install -y nginx
sudo pip install --upgrade pip
