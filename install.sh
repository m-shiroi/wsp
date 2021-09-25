#! /bin/env bash

declare -r REMOTE="remote"
declare -r SCRIPT="install.sh"

main() {
	local inst_type
	[ "${1}" == "${REMOTE}" ] && inst_type=${REMOTE}

	for el in $(ls); do
		[ -d "${el}" ] || continue
		[ -f "${el}/${SCRIPT}" ] || continue

		cd ${el}
		./${SCRIPT} ${inst_type}
		cd ..
	done
}

main $@
