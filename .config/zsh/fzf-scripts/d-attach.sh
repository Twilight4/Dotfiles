#!/usr/bin/env bash
#
# Select a docker container to start and attach to
#
# From fzf wiki: https://github.com/junegunn/fzf/wiki/examples

set -o pipefail
if [[ -n "$DEBUG" ]]; then
  set -x
fi

function debug() {
  if [[ -n "$DEBUG" ]]; then
    echo "$@"
  fi
}

function fail() {
  printf '%s\n' "$1" >&2  ## Send message to stderr. Exclude >&2 if you don't want it that way.
  exit "${2-1}"  ## Return a code specified by $2 or 1 by default.
}

function has() {
  # Check if a command is in $PATH
  which "$@" > /dev/null 2>&1
}

function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

if has docker; then
  dattach "$@"
else
  "Cannot find docker in $PATH"
fi