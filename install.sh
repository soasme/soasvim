rm ~/.vim/bundle -rf
rm ~/.vimrc

echo "installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc

mkdir -p ~/.vim/colors
cd ~/.vim/colors

curl https://raw.github.com/tpope/vim-vividchalk/master/colors/vividchalk.vim > vividchalk.vim
curl https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim > solarized.vim
curl https://raw.github.com/garybernhardt/dotfiles/master/.vim/colors/grb256.vim > grb256.vim
curl https://raw.github.com/sickill/vim-monokai/master/colors/Monokai.vim > Monokai.vim

echo "installing plugin using Vundle"
vim +BundleInstall! +BundleClean +q
