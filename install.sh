#!/bin/bash

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
mkdir -p ~/.vim/autoload ~/.vim/bundle
ln -svf $PWD/.vimrc ~/
ln -svf $PWD/.zshrc ~/
ln -svf $PWD/.zsh ~/
ln -svf $PWD/.tmux.conf ~/
ln -svf $PWD/.bashrc ~/
ln -svf $PWD/.vim ~/
ln -svf $PWD/.gitconfig ~/
ln -svf $PWD/.pylintrc ~/
ln -svf $PWD/.xmonad ~/
ln -svf $PWD/.mutt ~/
touch $PWD/.zsh/localrc
