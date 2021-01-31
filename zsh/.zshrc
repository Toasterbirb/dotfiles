# Startup commands
pfetch
#~/Scripts/bunpro.sh print && echo "————————————————————"
#cat ~/.cache/rank_term_cache | boxes -d stone

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/toasterbirb/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom aliases
# alias screenshot-cleaner='mono /home/toasterbirb/Tools/Screenshot-Cleaner.exe'
alias vim='nvim'
alias tablet-osu='xinput set-prop "HUION 420 Pen" --type=float "Coordinate Transformation Matrix" 3.5 0 -2.2 0 4 0.0 0 0 1 && notify-send -t 2000 "Osu config loaded"'
alias tablet-default='xinput set-prop "HUION 420 Pen" --type=float "Coordinate Transformation Matrix" 1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000 && notify-send -t 2000 "Default config loaded"'
alias mount-dir='cd /run/media/toasterbirb'
#alias home-backup='rsync -av --delete-after /home/toasterbirb/ /run/media/toasterbirb/Varmuuskopiot/toasterbirb/'
alias sc='cd ~/Projects/Suckless'
alias backup='sh ~/Scripts/system/backup.sh'
alias i3conf='vim ~/.config/i3/config'
alias i3scripts='cd ~/.config/i3/scripts/'
alias lspath='ls -d $PWD/*'
alias rm='rm -i'
alias cp='cp -iv'
alias mv='mv -iv'
alias package-browser="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias http-port='ngrok http 80 --region=eu'
alias kbd-reset='setxkbmap -layout fi'
alias bookmarks='vim ~/Scripts/bookmarks/sites'
alias sää='curl wttr.in/lappeenranta'
alias performance-monitor='sh /home/toasterbirb/Scripts/performance/performance-monitor'
alias reboot='doas protonvpn d && reboot'
alias shutdown='doas protonvpn d && shutdown'
alias mono-compile='mcs -out:build.exe'
alias cat='bat'
alias ms='~/Scripts/music-search.sh'
alias notes='~/Scripts/school/note-search.sh'
alias mail='mbsync koulu && neomutt'
alias mail-sync='mbsync koulu'
alias clock='termite -t "clock" -c ~/.config/termite/tty-clock-config -e "tty-clock -cs"'
alias ytdl='youtube-dl -x -i --audio-format mp3 --xattrs'
alias mpvs='mpv --no-audio-display --shuffle=yes --volume=70 ./'
alias dag='dragon-drag-and-drop'
alias wiki='nvim -c VimwikiIndex'
alias tatoeba='~/Scripts/tatoeba/tatoeba.sh'
alias reset-vpn-location='echo "" > /home/toasterbirb/.cache/vpn-location'
alias jelly-wake='wol -p 9 -i 192.168.1.255 00:21:86:f1:56:b4 ; wol -p 9 -i 192.168.9.255 00:21:86:f1:56:b4'
alias upscale='doas docker run --rm -it --gpus all -v /dev/dri:/dev/dri -v $PWD:/host k4yt3x/video2x:4.6.0 -d waifu2x_converter_cpp -r 2'
alias reload-grub='doas grub-mkconfig -o /boot/grub/grub.cfg'
alias ls='exa'
alias sys='cd ~/Scripts/system'
alias benchmark='hyperfine'
alias youtube-dl='youtube-dl -o "%(title)s.%(ext)s"'
alias emacs='emacs & disown'
alias virtual_screen='Xephyr -br -ac -noreset -screen 1280x720 :1 & disown ; echo "Run [DISPLAY=:1 (program)] to launch something into the virtual display"'
alias gccrun='gcc main.c && ./a.out'
alias screenshot='scrot -s /home/toasterbirb/Kuvat/scrot/%Y-%m-%d_$wx$h.png && cd /home/toasterbirb/Kuvat/scrot && ls --sort modified | tail -n 1 | xargs sxiv'

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
#		reconnect=$(doas protonvpn status | grep -i "error")
#		echo "$reconnect"
#		sleep 2
#	done
#}

alias vpn=doas protonvpn r


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
source $HOME/Projects/Git/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
