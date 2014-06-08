alias -s {js, css}=sublime
alias -s {sh}=vim
alias -s {mp4}=mplayer

alias rz="source ~/.zshrc"
alias za="vim ~/.zsh-configs/zsh-aliases.sh"
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
js='/home/aetetic/Projects/js'
#Alias for sublime unlink from terminal
if [[ $('uname') == 'Linux' ]]; then
  runst() { nohup /usr/bin/sublime $@ > /dev/null & }
  alias sut=runst
elif  [[ $('uname') == 'Darwin' ]]; then
  alias sut='open -a /Applications/Sublime\ Text\ 3.app'
fi
alias sutt='sut .'

alias agi="sudo apt-get install"

#aliases for git
alias gcl="git clone"

alias sus="sudo pm-suspend"

#Alias for xMonad startup script
alias xms='vim ~/.xMonad'

# Распаковка архивов
# example: extract file
extract () {
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tbz)       tar -xjvf $1    ;;
 *.tgz)       tar xzf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *)           echo "I don't know how to extract '$1'..." ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

# Запаковать архив
# example: pk tar file
pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)      tar cpvf $2.tar  $2       ;;
 bz2)    bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi

}   
