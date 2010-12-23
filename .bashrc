export PATH=~/bin:/opt/local/bin:/opt/local/sbin:/opt/local/include:/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin
export PS1='$(gemset)\[\033[01;32m\]\w \[\033[00;37m\]$(echo $(br) $(jobs | wc -l | tr -d " ")) \$\[\033[00m\] '
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
export LUA_PATH="$(echo ~)/.lua/?.lua;./?.lua"

shopt -s histappend

alias l='ls -l'
alias top='top -ocpu'
alias irb='irb --simple-prompt --readline'
alias rake='rake -s'
alias rebash='. ~/.bashrc'
alias bashrc='${EDITOR} ~/.bashrc; rebash; rvm reload'
alias vimrc='${EDITOR} ~/.vimrc'
alias gemi="gem install"
alias rc="rc -l"
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
alias global="rvm gemset use global"

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
  $1 -Tsvg -Gstylesheet="style.css" -o $2.svg $2 && open -a firefox $2.svg
}

gemset() {
  _gemset=`echo $GEM_HOME | cut -s -d@ -f2`

  if [[ -z $_gemset ]]; then
    echo ""
  else
    echo "$_gemset "
  fi
}

complete -W "$(cat ~/.ssh/config | cut -d' ' -f2 | tr '\n' ' ')" ssh
complete -o default -W "$(cat ~/.ssh/config | cut -d' ' -f2 | tr '\n' ' ')" scp
complete -W "$(ch find)" ch
complete -W "gemspec build release" joe
complete -f -W "open pack unpack" booklet
complete -W "up status ssh init destroy halt suspend resume provision reload package" vagrant

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
