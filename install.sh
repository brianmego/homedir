#!/bin/bash

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.config
mkdir -p ~/.config/alacritty

ln -svf $PWD/.vimrc ~/
ln -svf $PWD/.zshrc ~/
ln -svf $PWD/.zsh ~/
ln -svf $PWD/.tmux.conf ~/
ln -svf $PWD/nvim ~/.config/nvim
ln -svf $PWD/.bashrc ~/
ln -svf $PWD/.vim ~/
ln -svf $PWD/.vim/UltiSnips ~/.vim/UltiSnips
ln -svf $PWD/.gitconfig ~/
ln -svf $PWD/.pylintrc ~/
ln -svf $PWD/.xmonad ~/
ln -svf $PWD/.xmobarrc ~/
ln -svf $PWD/.mutt ~/
ln -svf $PWD/starship.toml ~/.config/starship.toml
ln -svf $PWD/zellij ~/.config/zellij
ln -svf $PWD/alacritty.toml ~/.config/alacritty/alacritty.toml

touch $PWD/.zsh/localrc
touch $PWD/.bashrc_local

if [[ `uname` == 'Linux' ]]; then
    ln -svf mailcap.linux $PWD/.mutt/mailcap
else
    ln -svf mailcap.osx $PWD/.mutt/mailcap
fi
ln -svf $PWD/.mutt/mailcap ~/.mailcap
