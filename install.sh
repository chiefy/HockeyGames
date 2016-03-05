#!/bin/bash

$(pip --version > /dev/null 2>&1)
HAS_PIP=$?

if [[ $HAS_PIP -gt 0 ]]; then
  echo "You don't seem to have pip installed, please install and try again."; exit 1
fi

echo "Installing livestreamer and pyCrypto..."
echo "---------------------------------------"
pip install livestreamer pyCrypto

if [[ $? -gt 0 ]]; then
  echo "There seems to be an issue installing the required packages with pip." exit 1;
fi

echo "Adding line to local /etc/hosts file, you will need to enter your password to change this file..."
sudo sh -c "echo '82.196.2.27 mf.svc.nhl.com' >> /etc/hosts"

if [[ $? -eq 0 ]]; then
  echo "Succesfully added line to /etc/hosts file"
fi
