#!/bin/sh
echo "Installing the depedencies, those scripts would throws some errors and SIGKILL the process...."
if [ whoami != root ]
then
sudo apt install apt-utils procps neofetch chafa -y
else
apt install sudo apt-utils procps neofetch chafa -y
fi
echo "Done...."
