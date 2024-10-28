#!/bin/bash
if ! command -v brew &> /dev/null
then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  echo "brew installed"
else
  echo "brew already installed"
fi

libs=( curl icu4c mise )
files=( alias gitconfig hyper.js zshrc )

for lib in ${libs[@]}
do
  brew install $lib
done

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done

source ~/.zshrc
