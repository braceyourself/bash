#!/bin/bash
# Author: Ethan Brace
### common aliases ###

alias s='sudo'
alias n='nano'
alias sn='sudo nano'
alias ls='clear; ls -la --color --group-directories-first'
alias cl='clear'
alias aa='add-alias'

### composer ###

alias comre='composer require'

### git aliases ###

alias nah='git reset --hard;git clean -df;'
alias gs='git status'
alias gi='git init'
alias gc='git commit -m'
alias gaa='git add .'

### laravel ###

alias lara-setup='cp .env.example .env; php artisan key:generate'
alias tinker='php artisan tinker'

### phpstorm ###

alias pstorm-help='composer require --dev barryvdh/laravel-ide-helper;composer require doctrine/dbal --dev;php artisan ide-helper:generate; php artisan ide-helper:meta;'



### added from terminal with add-alias() ###
alias python='python3'
alias d-ethan.braceyourself='cd /mnt/c/users/ethan/Code/ethan.braceyourself.solutions'
alias d-leagueasy='cd ~/Code/leagueasy.braceyourself.solutions'
alias d-drw='cd /mnt/c/users/ethan/Code/drwindows'
alias phpunit='clear && vendor/bin/phpunit'
alias sv='sudo vim'
alias sag='sudo apt-get'
alias aliases='n ~/.bash_aliases'
alias clear-vim-swap='rm ~/.vim/swap/**'
alias art='php artisan'
alias lara-remigrate='php artisan migrate:refresh && php artisan db:seed'
alias q='exit'
alias lara-keygen='php artisan key:generate'
alias ping='ping -c 3'
alias suweb='sudo -u www-data'
alias arti='php artisan'
alias watch='npm run watch'
alias mb-info='sudo dmidecode -t 2'
alias copy-envoy='cp ~/Envoy.blade.php ./'
alias envoy='~/.composer/vendor/bin/envoy'
alias deploy='git push; ~/.composer/vendor/bin/envoy run deploy'
alias push='git push; ~/.composer/vendor/bin/envoy run push'
alias lara-push-to-production='npm run production; git push; envoy run deploy; npm run dev;'
alias lara-log-watch='tail -f storage/logs/laravel.log'
alias d-windows.braceyourself='cd /mnt/c/users/ethan/Code/windows.braceyourself.solutions'
alias extip='echo $EXTIP'
alias cmd='/mnt/c/Windows/System32/cmd.exe /c'
alias psh='/mnt/c/Windows/System32/cmd.exe /c powershell -command "$@"'
alias d-cdc='cd /mnt/c/users/ethan/Code/cdc'
alias rsync='rsync --exclude-from "/mnt/c/Users/ethanabrace/rsync-exclude"'
alias d-braceyourself.solutions='cd /mnt/c/users/ethan/Code/braceyourself.solutions'
alias v-component='php artisan vueg:component'
alias npm='/usr/bin/npm'
alias serve='php artisan serve'

alias server='ssh ethanadmin@192.168.0.4'
alias d-pwa='cd /mnt/c/Users/ethan/code/udemy/pwa_course'
alias screens='screen -ls'
alias 'droplets.drw'='157.230.214.88'
alias d-api='cd /home/ethan/Code/api.braceyourself.solutions'
alias d-plugins='cd ~/Code/plugins'
alias g--='git checkout --'
