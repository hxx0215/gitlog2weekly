#!/bin/sh
defaultname=hxx0215
echo "input username or use default name"
read username
echo $username
if [ "$username" = "" ]; then
    echo "use default"
    username=$defaultname
fi
echo $username
cd /Users/hxx/work/project/pocketscanner
git log --pretty=format:"%an %s" --since=1.days --author=$username | grep "$username.*-" > ~/work/pocketscanner_log.txt
sed -i '' 's/hxx0215/PocketScanner/g' ~/work/pocketscanner_log.txt
