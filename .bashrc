#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

(wal -r -n &)
alias ls='ls --color=auto'
alias extract="/usr/local/bin/extract.sh"
alias steamcards="python2 /home/yuimaestro/Dev/python/IdleMaster/start.py"
alias steamhours="cd /home/yuimaestro/Dev/python/HourBoostr/ && mono HourBoostr.exe"
alias walset="wal -o /home/yuimaestro/wal-set.sh -i"
alias ranger='ranger --choosedir=$HOME/.config/rangerdir; cd $(cat $HOME/.config/rangerdir)'
alias tunnel="ssh -TND 4711 guk@77.73.65.40"
alias wine="WINEPREFIX=~/.winegames wine"
alias temp="nvidia-smi -q -d temperature"
PS1='[\u@\h \W]\$ '
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
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
