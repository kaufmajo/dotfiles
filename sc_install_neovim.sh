#!/bin/bash

TEMP_INSTALL_DIRECTORY=~/temp/neovim

# empty temp directory
rm "$TEMP_INSTALL_DIRECTORY/" -r

# create temp directory if not exists
if [[ ! -d "$TEMP_INSTALL_DIRECTORY" ]]; then
  
  echo "mkdir $TEMP_INSTALL_DIRECTORY"

  mkdir "$TEMP_INSTALL_DIRECTORY"

fi

# change into temp
cd "$TEMP_INSTALL_DIRECTORY"

# download latest image
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# change mode to execute
chmod u+x nvim.appimage

# install
./nvim.appimage --appimage-extract

# exposing nvim globally
sudo rm /squashfs-root -r
sudo mv squashfs-root /

# create symlink if not exists
if [[ ! -L "/usr/bin/nvim" ]]; then
  
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

fi

