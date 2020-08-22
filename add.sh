#! /bin/bash
for file in $(git diff --staged --name-only --diff-filter=AR | grep "^\..*")
do 
    echo $file >> list
done
sort -u -o list list
