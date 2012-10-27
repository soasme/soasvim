rm ~/.vim/bundle -rf
rm ~/.vimrc

echo "installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc

mkdir -p ~/.vim/colors
cd ~/.vim/colors
wget https://github.com/chriskempson/tomorrow-theme/raw/master/vim/colors/Tomorrow.vim
wget https://github.com/chriskempson/tomorrow-theme/raw/master/vim/colors/Tomorrow-Night.vim
wget https://github.com/chriskempson/tomorrow-theme/raw/master/vim/colors/Tomorrow-Night-Blue.vim
wget https://github.com/chriskempson/tomorrow-theme/raw/master/vim/colors/Tomorrow-Night-Bright.vim
wget https://github.com/chriskempson/tomorrow-theme/raw/master/vim/colors/Tomorrow-Night-Eighties.vim

echo "installing plugin using Vundle"
vim +BundleInstall! +BundleClean +q
