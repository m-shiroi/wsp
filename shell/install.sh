#! /bin/bash

declare -r REMOTE="remote"
declare -r SYNC_PROFILE="${HOME}/.profile"
declare -r SYNC_GITPROMPT="${HOME}/git-prompt"

main() {
	local bashrc="${HOME}/.bashrc"
	local inst_gitprompt="${PWD}/git-prompt"
	local inst_profile="${PWD}/profile"

	if [ ${inst_gitprompt} -ef  ${SYNC_GITPROMPT} ] && [ ${inst_profile} -ef ${SYNC_PROFILE} ]; then
		printf "(already)"
	else
		rm ${SYNC_GITPROMPT} ${SYNC_PROFILE}
		ln -s ${inst_gitprompt} ${SYNC_GITPROMPT}
		ln -s ${inst_profile} ${SYNC_PROFILE}
		echo "source ${SYNC_PROFILE}" >> ${bashrc} 
	fi
	echo "SET-UP: shell"
}

main $@
