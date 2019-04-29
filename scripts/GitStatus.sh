#!/bin/sh

# --------------------------- #
# Echo git branch and changes #
# for git status segment in   #
# powerline.
# --------------------------- #

# retrieve branch name
branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

# retrieve status
parse_git() {
    # if my branch exists
    if [ ! -z $branch ]; then
        [[ $(git status 2> /dev/null | tail -n1) != *"nothing to commit"*  ]] && echo ""
    fi
}



status=$(parse_git)
echo "${branch} ${status}"
