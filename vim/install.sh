#! /bin/bash

declare -r REMOTE="remote"
declare -r SYNC_FILE="${HOME}/.vimrc"
declare -r SYNC_FOLDER="${HOME}/.vim"

main() {
	local inst_file="${PWD}/vimrc"
	local inst_folder="${PWD}/vim"

	if [ ${inst_file} -ef  ${SYNC_FILE} ]; then
		printf "(already)"
	else
		rm -rf ${SYNC_FILE} ${SYNC_FOLDER}
		ln -s ${inst_folder} ${SYNC_FOLDER}
		ln -s ${inst_file} ${SYNC_FILE}
	fi

	echo "SET-UP: vim"
}

main $@
