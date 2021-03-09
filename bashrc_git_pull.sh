#!/bin/bash

cd /Users/Drew/playin/custom_bashrc;

# this checks if branch has local changes
r=$(node -e "const s=['Your branch is up to date','nothing to commit, working tree clean'];console.log(process.argv[1].includes(s[0])&&process.argv[1].includes(s[1]));" "$(git status)")

if [ $r == "true" ]
then
    git pull
fi
