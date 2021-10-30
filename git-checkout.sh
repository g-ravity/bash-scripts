#!/bin/bash
declare -A repoHashMap=( ["ab"]="admin-backend" ["af"]="admin-frontend" ["b"]="biz-logic" ["c"]="class" ["ch"]="ch" ["cr"]="cron" ["d"]="database" ["f"]="frontend" ["g"]="gateway" ["m"]="media" ["mo"]="mosql" ["o"]="overwatch" ["p"]="post" ["pi"]="pigeon" ["r"]="referral" ["s"]="search" ["sho"]="short" ["u"]="user" ["ut"]="utils" )
repoPrefix="yc-"
path="Documents/YC/"
defaultBranch="@staging"
shouldTakePull=true

Help(){
  echo
  echo "options:"
  echo
  echo "-r | --repos               Shorthand for repos for which script will run."
  echo "-b | --branch              New branch name to checkout to."
  echo "-c | --checkoutFrom        Branch name to checkout from (default is @staging)."
  echo "-e | --existingBranch      Existing branch name to checkout to."
  echo "-p | --pull                Take latest pull from remote (pass 'no' to avoid)."
  echo "-h | --help                Print this Help."
  echo
}

_setArgs(){
  while [ "${1:-}" != "" ]; do
    case "$1" in
      "-r" | "--repos")
        shift
        repos=($(echo $1 | tr "," "\n"))
        ;;
      "-b" | "--branch")
        shift
        branch=$1
        ;;
      "-c" | "--checkoutFrom")
        shift
        defaultBranch=$1
        ;;
      "-e" | "--existingBranch")
        shift
        existingBranch=$1
        ;;
      "-p" | "--pull")
        shift
        shouldTakePull=$1!='no'
        ;;
      "-h" | "--help")
        Help
        ;;
    esac
    shift
  done
}

_setArgs $*

for i in "${repos[@]}"
do
  cd ~
  cd "$path$repoPrefix${repoHashMap[$i]}"
  if [ -z "$existingBranch" ]
  then
    git checkout "$defaultBranch"
    if [ "$shouldTakePull" = true ]
    then
      git pull origin "$defaultBranch"
      yarn
    fi
    git checkout -b "$branch"
  else
    git checkout "$existingBranch"
    if [ "$shouldTakePull" = true ]
    then
      git pull origin "$existingBranch"
      yarn
    fi
  fi
done

echo "DONE!"



