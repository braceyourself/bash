#!/bin/bash
# Author: Ethan Brace

FILE_ALIASES=~/bash/aliases.sh
PRIVATE_ALIASES=~/bash/private-alias.sh

for file in $HOME/bash/functions.d/*.sh ; do source $file; done


alias rma='remove_alias';
alias aa='add_alias';
alias ca='change-alias'; 

