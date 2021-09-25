#! /bin/env bash

declare -r REMOTE="remote"
declare -r SYNC_FILE="${HOME}/.tmux.conf"

main() {
	local inst_type=${1}
	local inst_file="tmux.conf_m"

	[ "${inst_type}" == "${REMOTE}" ] && inst_file="tmux.conf_r"
	if [ ${inst_file} -ef  ${SYNC_FILE} ]; then
		printf "(already)"
	else
		rm ${SYNC_FILE}
		ln -s $(pwd)/${inst_file} ${SYNC_FILE}
	fi
	echo "SET-UP: tmux"
}

main $@
