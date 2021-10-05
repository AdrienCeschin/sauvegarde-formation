#!/bin/sh

RM='RM'
TRASH='TRASH'
RESTORE='RESTORE'
HELP='HELP'
DIR_TRASH='/home/vagrant/TRASH/'
DIR_TRASH_INFO='/home/vagrant/TRASH_INFO/'


trash_help() {
    echo 'Welcome to the help page.'
	echo 'The available options are the following :'
	echo '    - HELP : displays the help page you are consulting.'
	echo '    - TRASH : lists the files stored in the TRASH Directory.'
	echo '    - RM : moves a file from a directory to the TRASH directory. Please use this option within the directory containing the file you want to move.'
	echo '           Please pass as an argument only the name of the file you want to move. You can only move files one at a time.'
	echo '    - RESTORE : allows to move back a file stored within the TRASH directory to its original directory. Please pass as an argument only the name of the file you want to restore.'
	echo '           You can only restore one file at a time.'
	echo 'The TRASH directory is located at /home/vagrant/TRASH/.'
}


trash_arg_number_check() {
	if [ $# -e 0 ]; then
		trash_help
		1>&2 echo 'ERROR: you can not enter no argument. Please check out the manual. The manual can be accessed at anytime with the HELP argument.'
		exit 1
	fi

	if [ $# -gt 2 ]; then
		trash_help
		1>&2 echo 'ERROR: too many arguments. Please check out the manual. The manual can be accessed at anytime with the HELP argument.'
		exit 1
	fi
}




trash_test_file_exist() {
    FILE_TMP="${1:-}"
    test -f "$FILE_TMP"
}

trash_test_dir_exist() {
    test -d "$DIR_TRASH"
}

trash_test_info_exist() {
    test -d "$DIR_TRASH_INFO"
}




trash_create_dir() {
	if ! trash_test_dir_exist ; then
		mkdir "$DIR_TRASH"
	fi
	if ! trash_test_info_exist ; then
		mkdir "$DIR_TRASH_INFO"
	fi
}




trash_manage_restore() {
    FILE=${1:-}
    if ! (trash_test_dir_exist && trash_test_info_exist) ; then
	    echo 'WARNING: you can not restore any file, the TRASH directory does not exist (anymore).'
		exit 1
	fi
	INFO_FILE_PATH="$DIR_TRASH_INFO""$FILE"".info"
	INIT_PATH=$( cat "$INFO_FILE_PATH" )
	DIR_TRASH_FILE="$DIR_TRASH""$FILE"
	INIT_PATH_FILE="$INIT_PATH""/""$FILE"
	
	if trash_test_file_exist "$INIT_PATH_FILE" ; then
	    mv -i "$DIR_TRASH_FILE" "$INIT_PATH"
		if trash_test_file_exist "DIR_TRASH_FILE" ; then
		    echo 'The file has not been restored.'
		else 
		    rm "$INFO_FILE_PATH"
		fi
	else
	    mv "$DIR_TRASH_FILE" "$INIT_PATH"
		rm "$INFO_FILE_PATH"
	fi
}

trash_manage_trash() {
    if ! (trash_test_dir_exist && trash_test_info_exist) ; then
	    echo 'The TRASH directory does not exist, thus no file in there.'
		exit 0
	fi
	ls -l "$DIR_TRASH"
}

trash_manage_rm() {
    FILE=${1:-}
    if ! (trash_test_dir_exist && trash_test_info_exist) ; then
	    trash_create_dir
	fi
	
	FILE_INFO="$FILE"".info"
	FILE_INFO_PATH="$DIR_TRASH_INFO""$FILE_INFO"
	DIR_TRASH_FILE="$DIR_TRASH""$FILE"
	
	if trash_test_file_exist "$DIR_TRASH_FILE" ; then
	 
		if touch "$FILE_INFO_PATH" ; then 
			mv -i "$FILE" "$DIR_TRASH"
			if trash_test_file_exist "$FILE_INFO_PATH""/""$FILE" ; then
			    echo 'The file has not been removed.'
			else 
			    pwd > "$FILE_INFO_PATH"
			fi
		else 
			echo 'The file name you entered is not correct. Please check that this is the real name of the file, and not the path.'
			trash_help
		fi
	else 
	    if touch "$FILE_INFO_PATH" ; then 
			mv "$FILE" "$DIR_TRASH"
			if trash_test_file_exist "$FILE_INFO_PATH""/""$FILE" ; then
			    echo 'The file has not been removed.'
			else 
			    pwd > "$FILE_INFO_PATH"
			fi
		else 
			echo 'The file name you entered is not correct. Please check that this is the real name of the file, and not the path.'
			trash_help
		fi
	fi
}




ARG_MODE="${1:-}"
if [ -z "$ARG_MODE" ]; then
    trash_help
	1>&2 echo 'ERROR: invalid argument. Please check out the manual. The manual can be accessed at anytime with the HELP argument.'
	exit 1
fi

if [ "$ARG_MODE" = "$HELP" ]; then
    trash_help
elif [ "$ARG_MODE" = "$RM" ]; then
    ARG_TARGET="${2:-}"
	if trash_test_file_exist "$ARG_TARGET" ; then
        trash_manage_rm "$ARG_TARGET"
	else 
	    1>&2 echo 'ERROR: The file you want to remove does not exist. Please check the path of the file.'
	    exit 1
	fi
elif [ "$ARG_MODE" = "$TRASH" ]; then
    trash_manage_trash
elif [ "$ARG_MODE" = "$RESTORE" ]; then
    ARG_TARGET="${2:-}"
    trash_manage_restore "$ARG_TARGET"
else 
    trash_help
	1>&2 echo 'ERROR: invalid argument. Please check out the manual. The manual can be accessed at anytime with the HELP argument.'
	exit 1
fi