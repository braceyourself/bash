#!/bin/bash
# Author: Ethan Brace


FILE_ALIASES=~/bash/aliases.sh


has-arg(){
	for var in "$@"
	do

		if eval $var ;then echo yes; fi
	done
}

remove-alias(){
ALIAS_NAME=$1
	if [ -z $1 ]; then prompt 'What alias would you like to delete?:' ALIAS_NAME;	fi


	if ((!$(alias-exists $ALIAS_NAME))); then
		echo "'$ALIAS_NAME' alias not found"; 
		return;
	fi


	sed -i "/alias $ALIAS_NAME='*'/d" $FILE_ALIASES;

	unalias $ALIAS_NAME
	reload

	if ((!$(alias-exists $ALIAS_NAME))); then
		echo "$ALIAS_NAME deleted"; 
	fi
}
alias rma='remove-alias';



add-alias(){
	if [[ $1 ]]; then
		ALIAS_NAME=$1
	else
		prompt 'What would you like to call the alias?' ALIAS_NAME	
	fi

	SEARCH_FOR_MATCHING=$(grep "alias $ALIAS_NAME='*'" $FILE_ALIASES);
	if [[ ${#SEARCH_FOR_MATCHING}  -gt 0 ]];then
		prompt 'This alias already exists. Would you like to change it? [y/n] ' yn;

		if echo "$yn" | grep -iq "^y" ;then
			change-alias $ALIAS_NAME
		else
			echo No
		fi

		return;


	fi

	prompt 'Enter the command:' ALIAS_BODY

	echo "alias $ALIAS_NAME='$ALIAS_BODY'" >> $FILE_ALIASES;
	reload
}


alias aa='add-alias';



change-alias(){
	if [[ $1 ]]; then
		ALIAS_NAME=$1
	else
		prompt 'Which alias?:' ALIAS_NAME
	fi


	old_name=$ALIAS_NAME;
	# check that the alias exists
	ALIAS=$(grep -n "alias $ALIAS_NAME='*'" $FILE_ALIASES);
	if [[ ${#ALIAS} -eq 0 ]]; then
		echo "$ALIAS_NAME not found";
		return;
	fi


	#get body of alias from $ALIAS
	ALIAS_BODY=$(echo $ALIAS | cut -d "'" -f 2)
	old_body=$ALIAS_BODY

	# get user input for new alias 
	# and keep current if input is blank

	grep -n "alias $ALIAS_NAME='*'" $FILE_ALIASES
	prompt 'New Name[leave blank to keep the same]:' INPUT_NAME;
	prompt 'New Command:' INPUT_COM;

	if [[ ${#INPUT_NAME} -gt 0 ]]; then ALIAS_NAME=$INPUT_NAME; fi
	if [[ ${#INPUT_COM} -gt 0 ]]; then ALIAS_BODY=$INPUT_COM; fi

	
	# set up the new alias info
	INPUT_LINE="alias $ALIAS_NAME='$ALIAS_BODY'"

	# let the user know that they're removing an old alias
	if [[ $old_name != $ALIAS_NAME ]]; then
		echo "Replacing $old_name with $ALIAS_NAME";
	fi

	# replace old line with new line
	sed -i "s/alias $old_name='$old_body'/$INPUT_LINE/g" $FILE_ALIASES;
	# echo $INPUT_LINE >> $FILE_ALIASES;
	echo 'done';



	reload
	# show the alias as is	
	grep -n "alias $ALIAS_NAME='*'" $FILE_ALIASES 
	

}
alias ca='change-alias'; 

# search aliases.sh for a name of an alias
# return 0 if not found
alias-exists(){
	ALIAS_NAME=$1
	if [[ -z $1 ]]; then prompt 'what alias are you looking for?' ALIAS_NAME; fi

	echo ${#$(grep "alias $ALIAS_NAME='*'" $FILE_ALIASES)}
}


reload(){
	. ~/bash/.bash_includes;
}

prompt(){ # prompt-text variable-name
	# check bash type
	in-zsh(){
		out=$(ps  -ef | grep $$ | grep -v grep);
		if [[ $out == *"zsh"* ]]; then
			echo 1 
		elif [[ $out == *"bash"* ]];then
			echo 0
		fi
	}


	if [[ -z $1 ]] || [[ -z $2 ]];then
		echo 'error using prompt - need a prompt and variable to store input'	;
		return
	else
		declare -A input
		input[text]=$1
		input[var]=$2
	fi

	if (($(in-zsh))); then
		read "${input[var]}?${input[text]} "
	else
		read -p "${input[text]} " ${input[var]}
	fi



}
git-done(){
	
	if [ -z $1 ]; then prompt "Commit Message['a' to ammend]:" COMMIT_MESSAGE; else COMMIT_MESSAGE=$1; fi
	
	git add .
	echo 'added everything..'; echo;
	if [[ $COMMIT_MESSAGE == 'a' ]];then
		git commit --amend
	else
		git commit -m "$COMMIT_MESSAGE"
	fi

	echo 'committed'; echo;

	git push
	echo 'pushed'; echo;
}



testing(){
	echo 'testing'
}

