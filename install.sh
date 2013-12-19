rm ~/.vim/bundle -rf
rm ~/.vimrc

sudo apt-get install cmake
mkdir -p ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git /tmp/ycm
cd /tmp/ycm
git submodule update --init --recursive
./install.sh --clang-completer

echo "installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups

echo "installing plugin using Vundle"
vim +BundleInstall! +BundleClean +q
