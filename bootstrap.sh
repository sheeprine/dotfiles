#!/bin/sh

OS=$(uname)
if [ "$OS" = "Darwin" ]; then
  set -e
  if [ ! "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  brew install chezmoi
else
  if [ "$(command -v yum)" ]; then
    sudo yum update && sudo yum install -y chezmoi
  elif [ "$(command -v apt)" ]; then
    sudo apt update && sudo apt install -y chezmoi
  elif [ "$(command -v pacman)" ]; then
    sudo pacman -Sy && sudo pacman -S --noconfirm --needed chezmoi
  fi
fi
