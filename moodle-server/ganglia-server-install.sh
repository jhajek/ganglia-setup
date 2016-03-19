#!/bin/bash 
set -e
set -v

sudo add-apt-repository -y ppa:adiscon/v8-stable
sudo apt-get update -y
sudo apt-get install -y rsyslog git 

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y ganglia-monitor rrdtool gmetad ganglia-webfrontend

# Install Ganglia as a client to the central server

sudo cp /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/ganglia.conf

git clone https://github.com/jhajek/ganglia-setup.git /tmp/ganglia

sudo mv /tmp/ganglia/moodle-server/gmetad.conf /etc/ganglia/gmetad.conf

sudo mv /tmp/ganglia/moodle-server/gmond.conf /etc/ganglia/gmond.conf

sudo mv /tmp/ganglia/moodle-server/rsyslog.conf /etc/rsyslog.conf

sudo service rsyslog restart
