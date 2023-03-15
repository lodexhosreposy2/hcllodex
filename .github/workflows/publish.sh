TAG=${GITHUB_REF##*/}
echo "TAG"
echo $TAG
BRANCHES=$(git branch -r --contains tags/$TAG)
echo "BRANCHES"
echo $BRANCHES
for BRANCH in $BRANCHES; do
    echo "BRANCH"
    echo $BRANCH
#   if [[ $branch == "origin/main" ]]; then
#     onProtectedBranch=true
#   fi
done
if [ "$TAG" != "" ] && [ "$BRANCH" = "origin/main" ]
then 
    echo "Publishing"
    dir_path=$(dirname $(realpath $0))
    echo $dir_path
    make -C $dir_path/../.. publish
else 
    echo "Ignore publish"    
fi