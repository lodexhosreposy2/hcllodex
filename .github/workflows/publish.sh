TAG=${GITHUB_REF##*/}
BRANCH=$(git branch -r --contains tags/$TAG)
echo $HEAD_TAG
echo $BRANCH
if [ "$TAG" != "" ] && [ "$BRANCH" = "origin/main" ]
then 
    echo "Publishing"
    dir_path=$(dirname $(realpath $0))
    echo $dir_path
    make -C $dir_path/../.. publish
else 
    echo "Ignore publish"    
fi