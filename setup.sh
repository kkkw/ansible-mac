#!/bin/bash
ANSIBLE_PATH=~/workspace/ansible-mac
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
git clone -b template https://github.com/kkkw/ansible-mac.git ${ANSIBLE_PATH}
cd ${ANSIBLE_PATH}
