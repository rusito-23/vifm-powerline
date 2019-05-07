#!/bin/sh

# --------------------------- #
#           ICONS             #

UNTRACKED_ICO=''
UNSTAGED_ICO=''
STAGED_ICO=''

BEHIND_ICO=''
AHEAD_ICO=''

STASH_ICO=''
TAG_ICO=''
BOOKMARK_ICO=''

COMMIT_ICO=''
BRANCH_ICO=''

# --------------------------- #
#         GIT BRANCH          #

vcs_branch() {
    name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    [ ! -z $name ] && echo "${BRANCH_ICO} ${name}"
}

# --------------------------- #
#            STATUS           #

vcs_status() {
    # check for merge
    (git merge HEAD > /dev/null 2> /dev/null)
    local merge=$?
    [ $merge -ne 0 ] && echo "| merge" && return

    # if merge is not in progress
    local res=""

    # count untracked files
    local untrackedFiles=$(git ls-files --others --exclude-standard 2> /dev/null)
    [[ ! -z $untrackedFiles  ]] && res+=" ${UNTRACKED_ICO}"

    # count ustaged changes
    local unstaged=$(git ls-files --modified 2> /dev/null)
    [[ ! -z $unstaged ]] && res+=" ${UNSTAGED_ICO}"

    # count staged changes/files
    local staged=$(git diff --staged --name-status 2> /dev/null | wc -l)
    [ $staged -ne 0 ] && res+=" ${STAGED_ICO}"

    echo $res
}

# --------------------------- #
#            TAGS             #

vcs_commits() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    local res=""

    local ahead=$(git rev-list --count $branch@{upstream}..HEAD 2>/dev/null)
    (( ahead )) && res+=" ${AHEAD_ICO} $ahead"

    local behind=$(git rev-list --count HEAD..$branch@{upstream} 2>/dev/null)
    (( behind )) && res+=" ${BEHIND_ICO} $behind"

    echo $res
}

# --------------------------- #
#            TAGS             #

vcs_tag() {
    local tags=$(git describe --tags --abbrev=0 2> /dev/null)
    local res=""

    for tag in $tags; do
        res+="${TAG_ICO} $tag "
    done

    echo $res
}

# --------------------------- #
#           STASHES           #

vcs_stashes() {
    local stashes=$(git stash list 2> /dev/null |wc -l)
    (( stashes )) && echo "${STASH_ICO} ${stashes//[[:space:]]/}"
}

# --------------------------- #
#            MAIN             #
# --------------------------- #

vcs_main() {
    # are we inside repo?
    local repoTopLevel="$(command git rev-parse --show-toplevel 2> /dev/null)"
    [[ $? != 0 || -z $repoTopLevel ]] && return

    echo "$(vcs_branch) $(vcs_status) $(vcs_commits) $(vcs_tag) $(vcs_stashes)"
}

echo "$(vcs_main)"
