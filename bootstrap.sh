#!/bin/sh

OS=$(uname)
if [ $OS = "Darwin" ]; then
  test -x /usr/local/bin/brew || \
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install ansible
else
  if [ $(which yum) ]; then
    sudo yum update && sudo yum install -y ansible
  elif [ $(which apt) ]; then
    sudo apt update && sudo apt install -y ansible
  elif [ $(which pacman) ]; then
    sudo pacman -Sy && sudo pacman -S --noconfirm --needed ansible
  fi
fi
