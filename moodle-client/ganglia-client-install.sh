#!/bin/bash 
set -e
set -v

sudo add-apt-repository -y ppa:adiscon/v8-stable
sudo apt-get update -y
sudo apt-get install -y rsyslog git

sudo apt-get install -y ganglia-monitor 

git clone https://github.com/jhajek/ganglia-setup.git /tmp/ganglia

sudo cp /tmp/ganglia/gmond.conf /etc/ganglia/gmond.conf

sudo service ganglia-monitor
