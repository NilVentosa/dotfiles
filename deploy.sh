#!/bin/bash

repo_location="/Users/nil/repos/dotfiles"

deploy() {
    cp -fr $repo_location/$1 /Users/nil/$1
}

deploy .vim
deploy .bashrc
deploy .profile
deploy .bash_profile
deploy .profileMac

