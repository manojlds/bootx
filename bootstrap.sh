#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Current directory - $CURRENT_DIR"
echo "Installing or Updating Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

echo "Installing or Updating Ansible"
which -s ansible-playbook
if [[ $? != 0 ]] ; then
  brew install ansible
fi

ansible-playbook ansible/osx.yml -i 127.0.0.1, --ask-become-pass -e root_dir=$CURRENT_DIR -v
