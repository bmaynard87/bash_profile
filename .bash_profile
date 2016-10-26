export PATH=/usr/local/git/bin:/usr/local/bin:$PATH
# Configure command line colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -GFh'

alias vagrant_codeigniter='ruby ~/bin/vagrant_scripts/new-codeigniter-env.rb'
alias vagrant_laravel='ruby ~/bin/vagrant_scripts/new-laravel-env.rb'
alias composer="php /usr/local/bin/composer.phar"
alias vup="vagrant up"
alias vhalt="vargant halt"
alias back="cd .."
alias home="cd ~"
alias root="cd /"
alias cl="clear"
alias downl="cd ~/Downloads"
alias dir="pwd"

# Github commands
alias gb="git branch"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gl="git log"
alias glo="git log --pretty=oneline"
alias glu="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gh="git checkout"
alias gt="git tag"
alias grs="git reset"
alias grv="git revert"
alias gm="git merge"
alias gpom="git push origin master"
alias gpum="git pull origin master"
alias gd="git diff"
alias gpo="git push origin"
alias gob="git checkout -b"

# Set color variables
BLACK="\[\e[0;30m\]"
DARK_GRAY="\[\e[1;30m\]"
RED="\[\e[0;31m\]"
YELLOW="\[\e[0;33m\]"
PURPLE="\[\e[1;34m\]"
BLUE="\[\e[0;34m\]"
LIGHT_BLUE="\[\e[1;34m\]"
GREEN="\[\e[0;32m\]"
LIGHT_GREEN="\[\e[1;32m\]"
CYAN="\[\e[0;36m\]"
LIGHT_CYAN="\[\e[1;36m\]"
LIGHT_RED="\[\e[1;31m\]"
PURPLE="\[\e[0;34m\]"
LIGHT_PURPLE="\[\e[1;35m\]"
BROWN="\[\e[0;33m\]"
LIGHT_GRAY="\[\e[0;37m\]"
WHITE="\[\e[1;37m\]"

function setproj() {
	if [[ -n $1 ]]; then
		p="$1";
	else
		printf "\nProject name required (setproj <name>). Please select one of the following:\n\n";
		ls ~/Projects;
		printf "\n";
	fi
}

function setstage() {
	if [[ -n $1 ]]; then
		s="$1";
	else
		printf "\nStage name required (setstage <name>). Please select one of the following:\n\n";
		ls ~/Stages;
		printf "\n";
	fi
}

function proj() {
	cd ~/Projects;

	if [[ -n $1 ]]; then
		cd $1;
	elif [[ -n $p ]]; then
		cd $p;	
	fi
}

function stage() {
	cd ~/Stages;

	if [[ -n $1 ]]; then
		cd $1;
	elif [[ -n $s ]]; then
		cd $s;
	elif [[ -n $p ]]; then
		setstage $p;
		cd $p;
	fi
}

function ll() {
	ls -lha $@;
}

function trash() { 
	rm -rf $@; 
}

function vci() {
	stage;
	vagrant_codeigniter $@;
	cd $@;
}

function vlara {
	stage;
	vagrant_laravel $@;
	cd $@;
}

function depl() {
	if [[ -n $1 ]]; then
		proj;
		cd $1;
	fi
	
	./deploy.local.sh;
}

function migr() {
	if [[ -n $1 ]]; then
		proj;
		cd $1;
	fi
	
	./migrate.local.sh;
}

# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}

function bg {
	cd ~/Wallpapers;

	wget $1;

	cd -;
}

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi