#!/bin/bash
files=( alias bashrc bash_profile gemrc gitconfig hyper.js pryrc zshrc )
for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done
source ~/.bash_profile
