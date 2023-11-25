#!/usr/bin/env zsh

####################
# Package Managers #
####################

# Package management
fpac() {
    pacman -Slq | fzf --multi --reverse --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

fpar() {
    paru -Slq | fzf --multi --reverse --preview 'paru -Si {1}' | xargs -ro paru -S
}

fparr() {
    paru -Qq | fzf --multi --reverse --preview 'paru -Si {1}' | xargs -ro paru -Rns
}


#######
# Git #
#######

# git log browser with FZF
fgl() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

fgb() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}


##########
# Docker #
##########

d-attach() {
  set -o pipefail
  if [[ -n "$DEBUG" ]]; then
    set -x
  fi

  debug() {
    if [[ -n "$DEBUG" ]]; then
      echo "$@"
    fi
  }

  fail() {
    printf '%s\n' "$1" >&2  ## Send message to stderr. Exclude >&2 if you don't want it that way.
    exit "${2-1}"  ## Return a code specified by $2 or 1 by default.
  }

  has() {
    # Check if a command is in $PATH
    which "$@" > /dev/null 2>&1
  }

  dattach() {
    local cid
    cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
  }

  if has docker; then
    dattach "$@"
  else
    echo "Cannot find docker in \$PATH" >&2
  fi
}

# Select a docker image or images to remove
d-image-rm() {
  set -o pipefail
  if [[ -n "$DEBUG" ]]; then
    set -x
  fi

  debug() {
    if [[ -n "$DEBUG" ]]; then
      echo "$@"
    fi
  }

  fail() {
    printf '%s\n' "$1" >&2  ## Send message to stderr. Exclude >&2 if you don't want it that way.
    exit "${2-1}"  ## Return a code specified by $2 or 1 by default.
  }

  has() {
    # Check if a command is in $PATH
    which "$@" > /dev/null 2>&1
  }

  # Select a docker image or images to remove
  local image_ids
  image_ids=$(docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }')

  if [ -n "$image_ids" ]; then
    echo "$image_ids" | xargs -r docker rmi
  fi
}

if has docker; then
  drmi "$@"
else
  echo "Cannot find docker in \$PATH" >&2
fi

# Select a docker container to remove
d-rm() {
  set -o pipefail
  if [[ -n "$DEBUG" ]]; then
    set -x
  fi

  debug() {
    if [[ -n "$DEBUG" ]]; then
      echo "$@"
    fi
  }

  fail() {
    printf '%s\n' "$1" >&2  ## Send message to stderr. Exclude >&2 if you don't want it that way.
    exit "${2-1}"  ## Return a code specified by $2 or 1 by default.
  }

  has() {
    # Check if a command is in $PATH
    which "$@" > /dev/null 2>&1
  }

  drm_internal() {
    docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
  }

  if has docker; then
    drm_internal "$@"
  else
    echo "Cannot find docker in \$PATH" >&2
  fi
}

if has docker; then
  drm "$@"
else
  echo "Cannot find docker in \$PATH" >&2
fi

# Stop a docker container
d-stop-container() {
  set -o pipefail
  if [[ -n "$DEBUG" ]]; then
    set -x
  fi

  debug() {
    if [[ -n "$DEBUG" ]]; then
      echo "$@"
    fi
  }

  fail() {
    printf '%s\n' "$1" >&2  ## Send message to stderr. Exclude >&2 if you don't want it that way.
    exit "${2-1}"  ## Return a code specified by $2 or 1 by default.
  }

  has() {
    # Check if a command is in $PATH
    which "$@" > /dev/null 2>&1
  }

  d_stop_container_internal() {
    local cid
    cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

    [ -n "$cid" ] && docker stop "$cid"
  }

  if has docker; then
    d_stop_container_internal "$@"
  else
    echo "Cannot find docker in \$PATH" >&2
  fi
}

if has docker; then
  d_stop_container "$@"
else
  echo "Cannot find docker in \$PATH" >&2
fi


#########
# Other #
#########

# Browser quicklinks menu
fqli () {
    local options=(" Google" " Google (Private Tab)" " YouTube" " Github" " Github Trending" " Gmail" " Proton Mail" " MEGA" " Proton VPN" " Open Shopping Websites" " Amazon (US)" " Amazon (PL)" "󰒚 Allegro" "󰒚 OLX" " Helion" " HTB" " THM" " TCM" " OffSec" "󰚌 Root-me" " PentesterLab" " PWNX" " ChatGBT") 
    local choice=$(printf "%s\n" "${options[@]}" | fzf --preview "echo {}") 
    case $choice in
        (" Google") echo -n "Search Google: "
            read query
            if [ -z "$query" ]
            then
                xdg-open "https://www.google.com" &
            else
                xdg-open "https://www.google.com/search?q=$query" &
            fi ;;
        (" Google (Private Tab)") echo -n "Search Google (Private Tab): "
            read query
            if [ -z "$query" ]
            then
                firefox --private-window "https://www.google.com" &
            else
                firefox --private-window "https://www.google.com/search?q=$query" &
            fi ;;
        (" YouTube") echo -n "Search YouTube: "
            read query
            if [ -z "$query" ]
            then
                xdg-open "https://www.youtube.com/feed/subscriptions" &
            else
                xdg-open "https://www.youtube.com/results?search_query=$query" &
            fi ;;
        (" Github") echo -n "Search Github: "
            read query
            if [ -z "$query" ]
            then
                xdg-open "https://github.com" &
            else
                xdg-open "https://github.com/search?q=$query" &
            fi ;;
        (" Github Trending") xdg-open "https://github.com/trending" &
            ;;
        (" Gmail") xdg-open "https://mail.google.com" &
            ;;
        (" Proton Mail") xdg-open "https://mail.proton.me" &
            ;;
        (" MEGA") xdg-open "https://mega.nz" &
            ;;
        (" Proton VPN") xdg-open "https://account.proton.me/vpn" &
            ;;
		(" Open Shopping Websites") echo -n "Search Shopping Websites: "
            read query
            if [ -z "$query" ]
            then
                echo "Search query is empty."
            else
                xdg-open "https://www.amazon.com/s?k=$query" &
                xdg-open "https://www.amazon.pl/s?k=$query" &
                xdg-open "https://allegro.pl/listing?string=$query" &
                xdg-open "https://www.olx.pl/oferty/q-$query/" &
            fi ;;
        (" Amazon (US)") echo -n "Search Amazon (US): "
            read query
            if [ -z "$query" ]
            then
                xdg-open "https://www.amazon.com" &
            else
                xdg-open "https://www.amazon.com/s?k=$query" &
            fi ;;
        (" Amazon (PL)") echo -n "Search Amazon (PL): "
            read query
            if [ -z "$query" ]
            then
                xdg-open "https://www.amazon.pl" &
            else
                xdg-open "https://www.amazon.pl/s?k=$query" &
            fi ;;
        ("󰒚 Allegro") echo -n "Search Allegro: "
            read query
            if [ -z "$query" ]
            then
                xdg-open "https://www.allegro.pl" &
            else
                xdg-open "https://allegro.pl/listing?string=$query" &
            fi ;;
        (" OLX") echo -n "Search OLX: "
            read query
            if [ -z "$query" ]
            then
                xdg-open "https://www.olx.pl" &
            else
                xdg-open "https://www.olx.pl/oferty/q-$query/" &
            fi ;;
        (" Helion") xdg-open "https://helion.pl/kategorie/ksiazki/hacking" &
            ;;
        (" HTB") xdg-open "https://www.hackthebox.eu" &
            ;;
        (" THM") xdg-open "https://tryhackme.com" &
            ;;
        (" TCM") xdg-open "https://academy.tcm-sec.com" &
            ;;
        (" OffSec") xdg-open "https://www.offensive-security.com" &
            ;;
        ("󰚌 Root-me") xdg-open "https://www.root-me.org" &
            ;;
        (" PentesterLab") xdg-open "https://www.pentesterlab.com" &
            ;;
        (" PWNX") xdg-open "https://www.pwnx.io" &
            ;;
        (" ChatGBT") xdg-open "https://www.chat.openai.com" &
            ;;
    esac
}

# Display the directory stack with fzf. Jump to the directory when one selected
fpop() {
    # Only work with alias d (in zsh-aliases) defined as:
    # alias d='dirs -v'
    # for index ({1..9}) alias "$index"="cd +${index}"; unset index
    d | fzf --height="20%" | cut -f 1 | source /dev/stdin
}

# Better cd-ls navigation
fcd() {
    local dir
    dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf +m) && cd "$dir"
}

# List workspace projects
fwork() {
    result=$(find ~/desktop/workspace/* -type d -prune -exec basename {} ';' | sort | uniq | nl | fzf | cut -f 2)
    [ -n "$result" ] && cd ~/desktop/workspace/$result
}

# List projects
fproj() {
    result=$(find ~/desktop/projects/* -type d -prune -exec basename {} ';' | sort | uniq | nl | fzf | cut -f 2)
    [ -n "$result" ] && cd ~/desktop/projects/$result
}

# List pdfs
fpdf() {
    result=$(find ~ -type f -name '*.pdf' | fzf --bind "ctrl-r:reload(find -type f -name '*.pdf')" --preview "pdftotext {} - | less")
    [ -n "$result" ] && zathura "$result" &
}

# List tracking spreadsheets (productivity, money ...)
ftrack() {
    file=$(find ~/documents/org/roam/metrics/* -type f -prune -exec basename {} ';' | sort | uniq | nl | fzf | cut -f 2) || return
    [ -n "$file" ] && emacsclient -nw "$file"
}

# Find in File using ripgrep
fif() {
  if [ ! "$#" -gt 0 ]; then return 1; fi
  rg --files-with-matches --no-messages "$1" \
      | fzf --preview "highlight -O ansi -l {} 2> /dev/null \
      | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' \
      || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Find in file using ripgrep-all
fifa() {
    if [ ! "$#" -gt 0 ]; then return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" \
        | fzf-tmux -p +m --preview="rga --ignore-case --pretty --context 10 '"$*"' {}")" \
        && print -z "./$file" || return 1;
}

fclip() {
    cliphist list | fzf | cliphist decode | wl-copy
}

# Search through all man pages
function fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}
