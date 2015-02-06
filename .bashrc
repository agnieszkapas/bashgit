#Add this at the end of your .bashrc file

function parseGitBranch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function setPrompt () {
    YELLOW_B="\[\e[1;33m\]"
    GREEN_B="\[\e[1;32m\]"
    BLUE_B="\[\e[1;37m\]"
    NO_COLOUR="\[\e[0m\]"
    MY_PWD=$(getpwd)
    MY_GIT=$(parseGitBranch)
    PS1="$GREEN_B$MY_PWD$YELLOW_B$MY_GIT $NO_COLOUR\$ "
}

function getPwd () {
    GREEN_B='\\\[\\\e[1;32m\\\]'
    NO_COLOUR='\\\[\\\e[0m\\\]'
    HOME_DIR=~
    pwd | sed "s,^$HOME_DIR,~,g" | sed "s,/,$NO_COLOUR/$GREEN_B,g"
}
PROMPT_COMMAND=setPromp
