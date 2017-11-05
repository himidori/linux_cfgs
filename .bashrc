#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

(wal -r -n &)
alias ls='ls --color=auto'
alias extract="/usr/local/bin/extract.sh"
alias steamcards="python2 /home/yuimaestro/Dev/python/IdleMaster/start.py"
#alias steamhours="cd /home/yuimaestro/Dev/python/HourBoostr/ && mono HourBoostr.exe"
alias steamhours="ssh -p 49235 yuimaestro@ovz2.sumre4niy.znog6.vps.myjino.ru"
alias tun="ssh -p 49235 -TND 4711 yuimaestro@ovz2.sumre4niy.znog6.vps.myjino.ru"
alias walset="wal -o /home/yuimaestro/wal-set.sh -i"
alias ranger='ranger --choosedir=$HOME/.config/rangerdir; cd "$(cat $HOME/.config/rangerdir)"'
alias tunnel="ssh -TND 4711 guk@77.73.65.40"
#alias wine="WINEPREFIX=~/.winegames wine"
alias temp="nvidia-smi -q -d temperature"
alias gamma="xgamma -gamma"
alias mephi="ssh -p 22 b16v7509@samos.dozen.mephi.ru"
alias emacs="emacs --debug-init"
alias wsteam="WINEPREFIX=~/.winegames wine ~/.winegames/drive_c/Program\ Files/Steam/Steam.exe -no-cef-sandbox"
PS1='[\u@\h \W]\$ '
export GOPATH=$HOME/.local/go:$HOME/Dev/go
export PATH="$PATH:$HOME/.local/go/:$HOME/.local/go/bin:$HOME/Dev/go/bin"
export VISUAL="vim"
#dunst & 
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx

function chromium_tunnel {
    port=4711
    export SOCKS_SERVER=localhost:$port
    export SOCKS_VERSION=5
    chromium &
    exit
}
