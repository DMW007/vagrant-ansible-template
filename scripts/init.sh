#!/bin/bash
apt-get update && apt-get upgrade -y

tee -a ~/.bashrc > /dev/null <<EOT
  alias l='ls -lh'
  alias ll='ls -lha'
EOT

#test -e /usr/bin/python || (apt-get install -y python-minimal build-essential python-pip && pip install setuptools)
test -e /usr/bin/python || (apt-get install -y python3-minimal build-essential python3-pip && pip3 install setuptools)
apt-get install -y git vim htop

