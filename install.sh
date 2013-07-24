rm ~/.vim/bundle -rf
rm ~/.vimrc

echo "installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups

echo "installing plugin using Vundle"
vim +BundleInstall! +BundleClean +q
