#!/bin/bash

#
# This script creates symlinks in the home directory to any desired dotfiles in
# the ~/dotfiles
#

# variables

# dotfiles dir
dir=~/dotfiles 

# old dotfiles backup dir
olddir=~/dotfiles_old

# list of files/folder to symlink in the homedir
files="vimrc" 

# create backup dir
echo "Creating $olddir for back up of existing dotiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles dir
echo "Changing to the $dir dir"
cd $dir
echo "...done"

# move existing dotfiles to the backup dir, then create symlinks
for file in $files; do
    echo "Moving existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
