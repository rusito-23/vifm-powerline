#!/bin/sh

# --------------------------- #
#           ICONS             #
# --------------------------- #

UNTRACKED_ICO=''
UNSTAGED_ICO=''
STAGED_ICO=''

INCOMING_ICO=''
OUTGOING_ICO=''

STASH_ICO=''
TAG_ICO=''
BOOKMARK_ICO=''

COMMIT_ICO=''
BRANCH_ICO=''


# --------------------------- #
#         GIT BRANCH          #
# --------------------------- #

vcs_branch() {
    name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    [ ! -z $name ] && echo "${BRANCH_ICO} ${name}"
}


# --------------------------- #
#          UNTRACKED          #
# --------------------------- #
vcs_untracked() {
    local untrackedFiles=$(git ls-files --others --exclude-standard 2> /dev/null)
    [[ -z $untrackedFiles  ]] && return
    echo $UNTRACKED_ICO
}

# --------------------------- #
#            STAGE            #
# --------------------------- #
vcs_stage() {
    # TODO: Check for staged and unstaged changes!
    echo " "
}

# TODO: commits out and in, tags and stash
