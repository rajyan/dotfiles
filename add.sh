for file in $(git diff --staged --name-only --diff-filter=AR | grep "^\..*")
do 
    echo $file >> list
done
sort -o list list
