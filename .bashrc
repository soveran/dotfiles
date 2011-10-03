export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin
export PS1='$(_gemset)\[\033[01;32m\]\w \[\033[00;37m\]$(echo $(br) $(jobs | wc -l | tr -d " ")) \$\[\033[00m\] '
export MANPATH=/opt/local/share/man:/usr/share/man:/usr/local/share/man
export LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR=1
export EDITOR=vim
export GREP_OPTIONS="--color=auto"
export LESS='-RFX'
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export HISTCONTROL=erasedups
export HISTFILESIZE=1000
export HISTSIZE=1000
export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"
export CH_REPO="git@github.com:/soveran/ch-sheets.git"

shopt -s histappend

alias l='ls -l'
alias top='top -ocpu'
alias irb='irb --simple-prompt --readline'
alias rake='rake -s'
alias rebash='. ~/.bashrc'
alias bashrc='${EDITOR} ~/.bashrc; rebash; rvm reload'
alias vimrc='${EDITOR} ~/.vimrc'
alias gemi="gem install"
alias st="git status -sb"
alias gst="tig status"
alias gsh="git stash"
alias gsp="git stash pop"
alias gci="git commit"
alias gco="git checkout"
alias gdf="git diff --color-words"
alias ..="cd .."
alias ...="cd ../.."
alias pw="pwsafe -upE"
alias pwl="pwsafe --list"
alias psg="ps | grep"
alias hc="history -c"
alias gs="rvm gemset"
alias chibi="rlwrap chibi-scheme"
alias dc="rlwrap dc"

# Aliases for gnu tools.
alias prolog="gprolog"
alias forth="gforth"

# Aliases for coreutils from Homebrew.
brew_prefix=`brew --prefix`
alias base64="$brew_prefix/bin/gbase64"
alias chcon="$brew_prefix/bin/gchcon"
alias dir="$brew_prefix/bin/gdir"
alias dircolors="$brew_prefix/bin/gdircolors"
alias factor="$brew_prefix/bin/gfactor"
alias groups="$brew_prefix/bin/ggroups"
alias hostid="$brew_prefix/bin/ghostid"
alias md5sum="$brew_prefix/bin/gmd5sum"
alias pinky="$brew_prefix/bin/gpinky"
alias ptx="$brew_prefix/bin/gptx"
alias runcon="$brew_prefix/bin/gruncon"
alias seq="$brew_prefix/bin/gseq"
alias sha1sum="$brew_prefix/bin/gsha1sum"
alias sha225sum="$brew_prefix/bin/gsha225sum"
alias sha256sum="$brew_prefix/bin/gsha256sum"
alias sha384sum="$brew_prefix/bin/gsha384sum"
alias sha512sum="$brew_prefix/bin/gsha512sum"
alias shred="$brew_prefix/bin/gshred"
alias shuf="$brew_prefix/bin/gshuf"
alias tac="$brew_prefix/bin/gtac"
alias vdir="$brew_prefix/bin/gvdir"

ips() {
  ifconfig | grep 'inet ' | cut -d\  -f2 | tail -n 1

  inet=$(curl http://icanhazip.com/ 2> /dev/null)

  if [ ! -z $inet ]
  then
    echo "$inet"
    echo -n "$inet" | pbcopy
  fi
}

xml() {
  curl "$@" --location -s | tidy -xml -q -i | view -
}

pair() {
  git config --global user.name 'Michel Martens & Damian Janowski'
  git config --global user.email 'michel+djanowski@soveran.com'
  gci $@
  git config --global user.name 'Michel Martens'
  git config --global user.email 'michel@soveran.com'
}

gush() {
  git push origin $(br)
}

gup() {
  git pull
}

br() {
  test -d .git && git symbolic-ref HEAD 2> /dev/null | cut -d/ -f3
}

graph() {
  _svg=`basename $2 .dot`.svg
  $1 -Tsvg -Gstylesheet="style.css" -o $_svg $2 && open -a firefox $_svg
  unset _svg
}

_gemset() {
  _gemset=`echo $GEM_HOME | cut -s -d@ -f2`

  if [[ -z $_gemset ]]; then
    echo ""
  else
    echo "$_gemset "
  fi
}

serve() {
  { echo -ne "HTTP/1.0 200 OK\r\n\r\n"; cat "$1"; } | nc -l 8080
}

complete -f -W "$(cat ~/.ssh/config | cut -d' ' -f2 | tr '\n' ' ')" ssh
complete -o default -W "$(cat ~/.ssh/config | cut -d' ' -f2 | tr '\n' ' ')" scp
complete -W "gemspec build release install" joe

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
