#!/bin/zsh

#download oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#download syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#download autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#download fonts 
wget https://github.com/romkatv/powerlevel10k-media/raw/master/'MesloLGS%20NF%20Bold.ttf'
#download power lvl 10k 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 

#get some rc
#curl -o .zshrc ftp://192.168.178.128/.zshrc
#curl -o .p10k.zsh ftp://192.168.178.128/.p10k.zsh

#set fonts 
mkdir -p ~/.local/share/fonts
mv 'MesloLGS NF Bold.ttf' ~/.local/share/fonts/'MesloLGS NF Bold.ttf'
fc-cache -f -v

