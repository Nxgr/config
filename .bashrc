###USERDATA (AKA X0STUFF):


###COLORS###

BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
MAGENTA='\e[1;35m'
YELLOW='\e[1;33m'
LIGHTYELLOW='\e[0;33m'
WHITE='\e[1;37m'
NC='\e[0m' # No Color


###STUFF###


export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color='auto'"
alias ll="ls -Al"
alias la="ls -a"
alias lh="ls -Alh"
alias ld="ls -CFlh"

alias tarx="tar xvf"

alias diskspace="du -Sh | sort -n -r |more"

myinfo () {
  printf "CPU: "
  cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
  printf "\n"

  head -n1 /etc/issue | awk '{ printf "OS: %s %s %s | " , $1 , $2 , $3 }'
  uname -a | awk '{ printf "Kernel: %s " , $3 }'
  uname -m | awk '{ printf "%s " , $1 }'
  printf "\n"
}

###WELCOME SCREEN###
echo -ne "Hello, ${LIGHTBLUE}$USER${NC}. today is, "; date
echo -ne "${BLUE}Sysinfo:";uptime ;
#echo -ne "${NC}"; cal ;
echo -ne "${NC}";


function exitstatus {
        EXITSTATUS="$?"
	PS1="\[\e[0;36m\][\t] \[\e[1;33m\]\u\["
        if (( "$EXITSTATUS" == "130" )); then
	    PS1=$PS1"${MAGENTA}"
	elif (("$EXITSTATUS" == "1")) || (( ("$EXITSTATUS" >= "128") && ("$EXITSTATUS" <= "255") )); then
	    PS1=$PS1"${RED}"    
	elif (("$EXITSTATUS" == "2")) || (("$EXITSTATUS" == "126")) || (("$EXITSTATUS" == "127")); then
	    PS1=$PS1"${BLUE}"
	elif (("$EXITSTATUS" == "0")); then
	    PS1=$PS1"${NC}"
	else
	    PS1=$PS1"${CYAN}"e
        fi
	PS1=$PS1"\]@\[${NC}\]\h:\[\e[0;36m\]\w\[\e[0m\]\$ "
}

PROMPT_COMMAND=exitstatus
