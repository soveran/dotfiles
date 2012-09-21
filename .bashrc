export PATH=~/bin:/usr/local/Cellar/ruby/1.9.3-p125/bin:$PATH
export PS1='$(_gemset)$ '
export PROMPT_COMMAND="title"

alias chibi="rlwrap chibi-scheme"
alias st="git status -sb"
alias gst="tig status"
alias gsh="git stash --keep-index"
alias gsp="git stash pop"
alias gci="git commit"
alias gco="git checkout"
alias push="git push"
alias pull="git pull"

# Update window title in screen.
title() {
  printf "\033k`basename $PWD`\033\\"
}

_gemset() {
  if [[ -z $GS_NAME ]]; then
    echo ""
  else
    echo "$GS_NAME "
  fi
}

upload() {
  dst=files.soveran.com/misc/$2
  scp "$1" dreamhost:$dst
  echo http://$dst
}
