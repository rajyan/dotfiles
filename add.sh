for $file in $(git diff --diff-filter=AR | grep "^\..*")
do 
    echo $file >> list
done
sort -o list list
