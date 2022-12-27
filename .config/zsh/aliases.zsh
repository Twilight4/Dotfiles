#!/usr/bin/env zsh

# ls to exa
alias ls='exa -l -g --icons -t modified'
alias lc='exa -l -g --icons -t created'
alias la='ls -a -t modified -h'
alias lac='ls -a -t created -h'
alias tree='ls --tree --level=2 -a -t modified -h'

# other
alias tks='tmux kill-server'                               # tmux
alias yt3-mp3="yt-dlp --extract-audio --audio-format mp3 " # yt-dlp
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"     # wget

# git
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gitu='git add . && git commit && git push'

# pacman and yay
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias cleanup='yay -Sc'                          # remove orphaned packages

# colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# systemd
alias gcm="git checkout master"
alias gcs="git checkout stable"

# adding flags
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias vim='nvim'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# get fastest mirrors
#alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
#alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
#alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
#alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Zsh Directory Stack
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
