#!/bin/sh
KSDIR=${1}
cd $KSDIR
files=`git status -s`
echo "$files"
if [ "$files" == "" ]; then
    echo "No Files Changed, Exit."
    echo "*************************Finished  ${CURRENT} ************************"
    exit 0
else
    echo "Found Filed Changed! $files"
fi
CURRENT=`date +%Y%m%d%H%M%S`
echo 'pull origin master'
git pull origin/master
echo "add changed files."
git add .
echo "commit."
git commit -am "auto commit at $CURRENT"
echo "push."
git push
echo "gh-deploy"
sh $KSDIR/gh-deploy.sh
echo "*************************Finished  ${CURRENT} ************************"
