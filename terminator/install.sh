#! /bin/bash

declare -r REMOTE="remote"
declare -r SYNC_FONTS="${HOME}/.fonts/terminator_fonts"
declare -r SYNC_TERMINAL="${HOME}/.config/terminator"

main() {
	local inst_terminal="${PWD}/terminator"
	local inst_fonts="${PWD}/fonts"
	if [ ${inst_terminal} -ef  ${SYNC_TERMINAL} ] && [ ${inst_fonts} -ef ${SYNC_FONTS} ]; then
		printf "(already)"
	else
		rm -rf ${SYNC_FONTS} ${SYNC_TERMINAL}
		ln -s ${inst_fonts} ${SYNC_FONTS}
		ln -s ${inst_terminal} ${SYNC_TERMINAL}
	fi
	echo "SET-UP: terminator"
}

main $@
