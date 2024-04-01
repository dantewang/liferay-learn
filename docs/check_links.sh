#!/bin/bash

function check_grids {
	local link

	for link in $(ag --only-matching "\:link\:.*\.md" ${_MARKDOWN_FILE_NAME})
	do
		_LINK_FILE_NAME=$(echo ${link} | cut -d':' -f3 | sed 's/\ //g')

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_link "Grid link"

			fix_link ${@}
		fi
	done
}

function check_images {
	local link

	for link in $(ag --only-matching "\[.+?\]\(.*?\.(gif|jpg|png)\)" ${_MARKDOWN_FILE_NAME})
	do
		_LINK_FILE_NAME=$(echo ${link} | sed 's/\[.*\](\(.*\.\(gif\|jpg\|png\)\).*)/\1/g')

		use_english

		if ! ls "${_LINK_FILE_NAME}" || [[ ${_LINK_FILE_NAME} != *"/images/"* ]]
		then
			echo_broken_link "Image link"
		fi
	done
}

function check_includes {
	local link

	for link in $(ag --only-matching ".*include\}.*" ${_MARKDOWN_FILE_NAME})
	do
		_LINK_FILE_NAME=$(echo ${link} | sed 's/.*include\}\(.*\)/\1/g' | sed 's/ //g')

		local generated_code_warning
		local link_type

		if [[ $(echo ${link} | sed 's/.*{\(.*\)}.*/\1/g') == "literalinclude" ]]
		then
			link_type="Literal include"

			use_english

			local resources_dir_name=$(echo ${_LINK_FILE_NAME} | sed 's/\(.*\/resources\/\).*/\1/g')

			if [[ $(ag -g .*service\.xml ${resources_dir_name} 2>/dev/null) ]]
			then
				generated_code_warning="WARNING: This may reference code generated by Service Builder."
			fi

			if [[ $(ag --file-search-regex "update_example\.sh" "generate_custom_element" ${resources_dir_name} 2>/dev/null) && ! $(ag --files-with-matches liferay-.*-overlay 2>/dev/null) ]]
			then
				generated_code_warning="WARNING: This may reference code generated by update_example.sh."
			fi
		else
			link_type="Include"

			local snippets_dir_name=$(git rev-parse --show-toplevel)/docs/$(echo ${1} | cut -d'/' -f1-3)

			_LINK_FILE_NAME=${snippets_dir_name}${_LINK_FILE_NAME}
		fi

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_link ${link_type} ${generated_code_warning}
		fi
	done
}

function check_landing_pages {
	local landing_page_reference

	for landing_page_reference in $(ag --no-filename --no-numbers "\:file\:.*landing\.html" ${_MARKDOWN_FILE_NAME})
	do
		_LANDING_PAGE_LINK_FILE_NAME=$(echo ${landing_page_reference} | sed 's/\:file\://g' | sed 's/\ //g')

		local link

		for link in $(ag --no-filename "url\:" ${_LANDING_PAGE_LINK_FILE_NAME})
		do
			if [[ ${link} != *"https://"* ]]
			then
				_LINK_FILE_NAME=$(echo ${link} \
					| sed "s/.*\('\|\"\)\(.*\)\('\|\"\|\#\).*/\2/g" \
					| sed 's/\(.*\)#.*/\1/g' \
				)

				if ! ls "${_LINK_FILE_NAME/.html/.md}"
				then
					echo "Landing page link:"
					echo "    Landing page reference: ${_LANDING_PAGE_LINK_FILE_NAME}"
					echo "    Link: ${_LINK_FILE_NAME/.md/.html}"
					echo

					fix_link ${@} landing
				fi
			fi
		done
	done
}

function check_markdown {
	local links

	for links in $(ag --only-matching '\[.*\]\((?!http).*\.md.*\).*' ${_MARKDOWN_FILE_NAME})
	do
		for _LINK_FILE_NAME in $(echo ${links} | sed -e 's/\.md)/\.md)\n/g' | sed 's/.*\](\(.*\.md\).*).*/\1/g')
		do
			if [[ ${_LINK_FILE_NAME} == *".md" ]]
			then
				if ! ls "${_LINK_FILE_NAME}"
				then
					echo_broken_link "Markdown link"

					fix_link ${@}
				fi
			fi
		done
	done
}

function check_tocs {
	local link

	for link in $(ag --only-matching "(?s)toc\:.*^---$" ${_MARKDOWN_FILE_NAME} | ag --nomultiline --nonumbers ".*\.md$")
	do
		_LINK_FILE_NAME=$(echo "${link}" | rev | cut -d' ' -f1 | rev)

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_link "TOC link"

			fix_link ${@}
		fi
	done
}

function echo_broken_link {
	if [[ -z ${_CURRENT_MARKDOWN_FILE_NAME} || ${_CURRENT_MARKDOWN_FILE_NAME} != ${_MARKDOWN_FILE_NAME} ]]
	then
		_CURRENT_MARKDOWN_FILE_NAME=${_MARKDOWN_FILE_NAME}

		echo $(git rev-parse --show-prefix | cut -d'/' -f2-)${_MARKDOWN_FILE_NAME}
		echo
	fi

	_LINK_FILE_NAME=$(echo ${_LINK_FILE_NAME} | sed 's/.*liferay-learn\/docs\///g' | sed 's/\/\.\//\//g')

	if ! [ -z ${2} ]
	then
		echo "    ${2}"
	fi
	echo "    ${1}: ${_LINK_FILE_NAME}"
	echo
}

function fix_link {
	if [[ ${2} == "--fix" ]]
	then
		local link_base_file_name=$(echo ${_LINK_FILE_NAME} | rev | cut -d'/' -f1 | rev)

		local correct_link_file_name=$(ag -g "/${link_base_file_name/.html/.md}" "${_DOCS_DIR_NAME}/${_LANGUAGE_DIR_NAME}" 2>/dev/null)

		local replace_in_file_name=${_MARKDOWN_FILE_NAME}

		if [[ ${correct_link_file_name} == *".md"*".md"* ]]
		then
			echo "    WARNING: Unable to fix because ${link_base_file_name} is not unique in $_LANGUAGE_DIR_NAME}."
			echo
		elif [[ ${correct_link_file_name} ]]
		then
			correct_link_file_name=$(realpath --relative-to=${PWD} ${correct_link_file_name})

			if [[ ${3} == "landing" ]]
			then
				correct_link_file_name=$(echo ${correct_link_file_name} | sed 's/\.md/\.html/g')

				replace_in_file_name=${_LANDING_PAGE_LINK_FILE_NAME}
			fi

			sed -i "s,(${_LINK_FILE_NAME}),(${correct_link_file_name}),g" ${replace_in_file_name}
			echo "    Fixed: ${correct_link_file_name}"
			echo
		else
			echo "    WARNING: Unable to fix ${_LINK_FILE_NAME} in ${replace_in_file_name}."
			echo
		fi
	fi
}

function ls {
	command ls "$@" > /dev/null 2>&1
}

function main {
	IFS=$'\n'

	if [ -z ${1} ]
	then
		echo "To report broken links: ./check_links.sh dxp/latest/en"
		echo
		echo "To report and attempt fixing broken links: ./check_links.sh dxp/latest/en --fix"

		exit 0
	fi
	if [[ ${2} == "--fix" ]]
	then
		if [[ $(git status --short -- ${1}) ]]
		then
			echo "WARNING: There are uncommitted changes. Do not run with --fix unless there is nothing reported by \"git status --short -- ${1}\"."

			git status --short -- ${1}

			exit 0
		fi
	fi

	_DOCS_DIR_NAME=$(pwd ./)

	_LANGUAGE_DIR_NAME=$(echo ${1} | cut -d'/' -f1-3)

	local markdown_dir_name

	for markdown_dir_name in $(find ${1} -name '*.md' -printf '%h\n' | sort -u)
	do
		pushd ${markdown_dir_name} > /dev/null

		for _MARKDOWN_FILE_NAME in $(find . -maxdepth 1 -name "*.md" -printf '%f\n')
		do
			check_grids ${@}
			check_images
			check_includes ${@}
			check_landing_pages ${@}
			check_markdown ${@}
			check_tocs ${@}
		done

		popd > /dev/null
	done

	unset IFS
}

function use_english {
	local language_code=$(pwd ${_MARKDOWN_FILE_NAME} | sed 's,.*/\(en\|ja\|ko\)/.*,\1,g')

	if [[ ${language_code} != "en" ]]
	then
		_LINK_FILE_NAME=$(pwd ${_LINK_FILE_NAME})/${_LINK_FILE_NAME}

		_LINK_FILE_NAME=$(echo ${_LINK_FILE_NAME} | sed "s,/${language_code}/,/en/,g")
	fi
}

main "${@}"