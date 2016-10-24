export PATH=/usr/local/git/bin:/usr/local/bin:$PATH

alias vagrant_codeigniter='ruby ~/bin/vagrant_scripts/new-codeigniter-env.rb'
alias vagrant_laravel='ruby ~/bin/vagrant_scripts/new-laravel-env.rb'
alias composer="php /usr/local/bin/composer.phar"
alias gs="git status"
alias vup="vagrant up"
alias vhalt="vargant halt"
alias back="cd .."
alias home="cd ~"
alias root="cd /"
alias cl="clear"
alias downl="cd ~/Downloads"
alias dir="pwd"

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

function bg {
	cd ~/Wallpapers;

	wget $1;

	cd -;
}

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
