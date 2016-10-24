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

function proj() {
	cd ~/Projects;

	if [[ -n $1 ]]; then
		cd $1;
	fi
}

function stage() {
	cd ~/Stages;

	if [[ -n $1 ]]; then
		cd $1;
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
