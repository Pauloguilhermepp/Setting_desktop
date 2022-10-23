#!/bin/bash

# Creating files to save installation and error messages
USER_HOME="/home/$SUDO_USER"
cd $USER_HOME/Desktop

echo -e 'Messages sent to stdout during the installation process:\n' >> stdout_msgs.txt
echo "Stdout redirected to: $USER_HOME/Desktop/stdout_msgs.txt"

echo -e 'Messages sent to stderr during the installation process:\n' >> stderr_msgs.txt
echo "Stderr redirected to: $USER_HOME/Desktop/stderr_msgs.txt"

# Computer configuration

## Dark mode
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark' >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Dark mode has been set.'

## Place dock horizontally
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Dock position has been set.'

## Blue light filter
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3125 >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Blue light filter has been set.'

## Creating .bash_aliases
echo '#!/bin/bash\n' > $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
echo '# Python aliases:' >> $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
echo 'alias python='\'python3\' >> $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
echo 'alias py='\'python3\' >> $USER_HOME/.bash_aliases 2>> stderr_msgs.txt
source $USER_HOME/.bash_aliases >> stdout_msgs.txt 2>> stderr_msgs.txt
echo '.bash_aliases file has been configured.'

# Set new wallpaper
cd ~
cd Pictures && mkdir Wallpapers
cd Wallpapers
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1-bJYlG1eJcQeMeBRwVtvm4VGvuZo5vWn' -O wallpaper.png 2>> stderr_msgs.txt
gsettings set org.gnome.desktop.background picture-uri file://$USER_HOME/Pictures/Wallpapers/wallpaper.png
echo "New wallpaper set!"
cd ~

# Download packages

## Update and upgrade apt
sudo apt-get update >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo apt-get upgrade -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Apt updated and upgraded.'

## Chrome
wget -P $USER_HOME/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo apt-get install $USER_HOME/Downloads/google-chrome-stable_current_amd64.deb >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Google chrome has been installed and properly configured.'

## Discord
sudo snap install discord -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Discord has been installed and properly configured.'

## Vscode
sudo apt install software-properties-common apt-transport-https wget >> stdout_msgs.txt 2>> stderr_msgs.txt
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" >> stdout_msgs.txt 2>> stderr_msgs.txt
sudo apt install code >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Vscode has been configured.'

## Vscode extensions
code --install-extension tomoki1207.pdf >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension ms-python.python >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension formulahendry.code-runner >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension MS-vsliveshare.vsliveshare >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension streetsidesoftware.code-spell-checker >> stdout_msgs.txt 2>> stderr_msgs.txt
code --install-extension streetsidesoftware.code-spell-checker-portuguese >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Vscode extensions have been configured.'

## Git
sudo apt-get install git -y >> stdout_msgs.txt 2>> stderr_msgs.txt
echo 'Git has been configured.'

## NeoVim install and config
### Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
### Install neovim
sudo sudo apt install ./nvim-linux64.deb >> stdout_msgs.txt 2>> stderr_msgs.txt
### Install init.vim
cd ~/.config/nvim
wget --no-check-certificate https://raw.githubusercontent.com/OctavioFurio/Neovim-config/main/config.txt
mv config.txt init.vim
echo 'Neovim has been installed and properly configured with default configuration.'
echo 'Neovim init.vim file can be found at ~/.config/nvim/init.vim .'
echo 'When running Neovim for the first time, run :PlugInstall to install all plugins.'
### You can make sure NeoVim is always used by setting up aliases as well.
# alias vi="nvim"
# alias vim="nvim"
cd ~

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

## END

echo 'All settings were properly set, and all software has been downloaded.'
echo 'Enjoy!'
