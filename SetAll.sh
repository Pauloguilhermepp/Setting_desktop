#!/bin/bash

# Creating files to save installation and erro messages
USER_HOME="/home/$SUDO_USER"
cd $USER_HOME/Desktop

echo -e 'Messages sent to stdout during the installation process:\n' >> stdout_msgs.txt
echo "Stdout redirected to: $USER_HOME/Desktop/stdout_msgs.txt"

echo -e 'Messages sent to stderr during the installation process:\n' >> stderr_msgs.txt
echo "Stderr redirected to: $USER_HOME/Desktop/stderr_msgs.txt"


# Computer configuration

## Dark mode
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark' >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Dark mode has been configured.'

## Place dock horizontally
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Dock position has been configured.'

## Blue light filter
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3125 >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Blue light filter has been configured.'

## Creating .bash_aliases
echo '#!/bin/bash\n' > $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
echo '# Python aliases:' >> $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
echo 'alias python='\'python3\' >> $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
echo 'alias py='\'python3\' >> $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
source $USER_HOME/.bash_aliases >> stdout_msgs.txt 2>> stderr_msgs.txt
echo '.bash_aliases file has been configured.'


# Download packages

## Update and upgrade apt
sudo apt-get update >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo apt-get upgrade -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Apt updated and upgraded.'

## Chrome
wget -P $USER_HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo apt-get install $USER_HOME/Downloads/google-chrome-stable_current_amd64.deb >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Google chrome has been configured.'

## Discord
sudo snap install discord -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Discord has been configured.'

## Vscode
sudo snap install code >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Vscode has been configured.'

## Vscode extensions
code --install-extension tomoki1207.pdf >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension ms-python.python >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension formulahendry.code-runner >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension MS-vsliveshare.vsliveshare >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension streetsidesoftware.code-spell-checker >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension streetsidesoftware.code-spell-checker-portuguese >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Vscode extensions have been configured.'

## Vim
sudo apt-get install vim -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Vim has been configured.'

## Git
sudo apt-get install git -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Git has been configured.'

## Oracle Virtual Box
sudo apt-get install virtualbox -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Oracle Virtual Box has been configured.'

## Vlc
sudo apt-get-get install vlc -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Vlc has been configured.'

## Python
sudo apt-get install python3.8 -y >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo apt-get-get install python3-pip -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Python has been configured.'

## Python libraries
pip install numpy >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install scipy >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install sympy >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install numba >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install keras >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install pillow >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install anytree >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install tensorflow >> stdout_msgs.txt 2>> stderr_msgs.txt
pip install matplotlib >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Python libraries have been configured.'

## gcc and g++ compilers
sudo apt-get install build-essential >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'gcc and g++ compilers have been configured.'

## Java
sudo apt-get install default-jre -y >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo apt-get install default-jdk -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Java has been configured.'
