# Startup commands
pfetch
#~/Scripts/bunpro.sh print && echo "————————————————————"
#cat ~/.cache/rank_term_cache | boxes -d stone

# Completion menu
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Fix cd capitalization typos
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# vim runtime
export VIMRUNTIME="/home/toasterbirb/.local/share/nvim/runtime"

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Prompt
PROMPT=" %~ %F{blue}>%f "

export LFS=/mnt/lfs
export LFS_portable=/mnt/lfs-portable
export _JAVA_AWT_WM_NONREPARENTING=1

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Custom aliases
[ -f $HOME/.config/zsh/aliasrc ] && source "$HOME/.config/zsh/aliasrc"

## Näytön ohjaimen vaihto
function selectGPU()
{
    case $1 in
        intel) optimus-manager --temp-config /home/toasterbirb/.config/Optimus\ Manager/intel-config.conf && reboot ;;
        nvidia) optimus-manager --temp-config /home/toasterbirb/.config/Optimus\ Manager/nvidia-config.conf && reboot ;;
        help) echo -e "Vaihtoehdot\n1. intel\n2. nvidia\n\nEsim: 'gpu intel'" ;;
    esac
}

alias gpu='selectGPU'

# VPN Reconnection
#function r_vpn()
#{
#	while [ -n reconnect ]
#	do
#		reconnect=$(sudo protonvpn status | grep -i "error")
#		echo "$reconnect"
#		sleep 2
#	done
#}

alias vpn=sudo protonvpn r


## cd + ls
function cdls()
{
    cd $1
    [ $(ls | wc -l) -le 30 ] && ls
}
alias cd='cdls'

## Typo aliakset
alias sl='exa'

# Created by `userpath` on 2019-12-31 12:56:18
export PATH="$PATH:/home/toasterbirb/.local/bin"
export PATH="$PATH:/home/toasterbirb/.cargo/bin"
export PATH="$PATH:/home/toasterbirb/Scripts"
export PATH="$PATH:/home/toasterbirb/Scripts/id3_tagger"
export PATH="$PATH:/home/toasterbirb/.emacs.d/bin"
export PATH="$PATH:/home/toasterbirb/Programs/miniconda3/bin"
export EDITOR=/usr/bin/nvim
export TERM=termite
export TERMCMD=termite
export QT_QPA_PLATFORMTHEME=qt5ct

# pfetch variables
export PF_ASCII="arch"
export PF_INFO="ascii title os kernel wm pkgs uptime memory "

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#ranger() {
#    if [ -z "$RANGER_LEVEL" ]; then
#        /usr/bin/ranger "$@"
#    else
#        exit
#    fi
#}

LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
alias lf='lfcd'

# Less variables
export LESS_TERMCAP_mb="$(echo -e '\e[37m')"
export LESS_TERMCAP_md="$(echo -e '\e[32m')"
export LESS_TERMCAP_so="$(echo -e '\e[35m')"
export LESS_TERMCAP_us="$(echo -e '\e[36m')"
export LESS_TERMCAP_me="$(echo -e '\e[0m')" 
export LESS_TERMCAP_ue="$(echo -e '\e[0m')" 
export LESS_TERMCAP_se="$(echo -e '\e[0m')" 
export LESS_TERMCAP_mr="$(echo -e '\e[7m')" 
export LESS_TERMCAP_mh="$(echo -e '\e[2m')" 
export LESS_TERMCAP_ZN="$(echo -e '\e[31m')"
export LESS_TERMCAP_ZV="$(echo -e '\e[31m')"
export LESS_TERMCAP_ZO="$(echo -e '\e[31m')"
export LESS_TERMCAP_ZW="$(echo -e '\e[31m')"
export GROFF_NO_SGR=1                       

#export MANGOHUD=1
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export XIM_PROGRAM=/usr/bin/ibus-daemon
export GOPATH="$HOME/Programs/go"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
source /home/toasterbirb/Scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $HOME/Projects/Git/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
