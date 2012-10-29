rm ~/.vim/bundle -rf
rm ~/.vimrc

echo "installing Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc

mkdir -p ~/.vim/colors
cd ~/.vim/colors

curl https://raw.github.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow.vim > Tomorrow.vim
curl https://raw.github.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim > Tomorrow-Night.vim
curl https://raw.github.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Blue.vim > Tomorrow-Night-Blue.vim
curl https://raw.github.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Bright.vim > Tomorrow-Night-Bright.vim
curl https://raw.github.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Eighties.vim > Tomorrow-Night-Eighties.vim

echo "installing plugin using Vundle"
vim +BundleInstall! +BundleClean +q
