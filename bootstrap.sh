#!/usr/bin/env bash

echo "Installing or Updating Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi
echo -e "\n\n"

echo "Installing or Updating Ansible"
which -s ansible-playbook
if [[ $? != 0 ]] ; then
  brew install ansible
fi
echo -e "\n\n"