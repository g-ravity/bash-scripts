#!/bin/bash
declare -A repoHashMap=( ["ab"]="admin-backend" ["af"]="admin-frontend" ["b"]="biz-logic" ["c"]="class" ["ch"]="ch" ["cr"]="cron" ["d"]="database" ["f"]="frontend" ["g"]="gateway" ["m"]="media" ["mo"]="mosql" ["o"]="overwatch" ["p"]="post" ["pi"]="pigeon" ["r"]="referral" ["s"]="search" ["sho"]="short" ["u"]="user" ["ut"]="utils")
repoPrefix="yc-"
path="Documents/YC/"
defaultBranch="@staging"

while getopts "r:b:c:e:" arg; do
  case $arg in
    r) repos=($(echo $OPTARG | tr "," "\n"));;
    b) branch=$OPTARG;;
    c) defaultBranch=$OPTARG;;
    e) existingBranch=$OPTARG;;
  esac
done

for i in "${repos[@]}"
do
  cd ~
  cd "$path$repoPrefix${repoHashMap[$i]}"
  if [ -z "$existingBranch" ]
  then
    git checkout "$checkoutBranch"
    git checkout -b "$branch"
  else
    git checkout "$existingBranch"
  fi
done

echo "DONE!"



