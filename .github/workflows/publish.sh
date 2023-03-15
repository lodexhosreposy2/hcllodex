HEAD_TAG=$(git tag --points-at HEAD)
REF=${GITHUB_REF##*/}
echo $HEAD_TAG
echo $REF
if [ "$HEAD_TAG" != "" ] && [ "$REF" = "main" ]
then 
    echo "Publishing"
    dir_path=$(dirname $(realpath $0))
    echo $dir_path
    make -C $dir_path/../.. publish
else 
    echo "Ignore publish"    
fi