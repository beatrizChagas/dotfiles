#!/bin/bash
files=( alias gitconfig hyper.js zshrc )
for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done
source ~/.zshrc
