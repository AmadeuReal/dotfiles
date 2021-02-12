#!/usr/bin/env bash

git pull origin main;

function doIt() {

	rsync --exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		-avh --no-perms ./files/ ~;
	source ~/.bash_profile;

    for i in $(find ./*/ -type f -name '*.sh')
        do sh "$i"
    done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;