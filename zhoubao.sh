#!/bin/sh
defaultname=hxx0215
workspace=~/work
projectPath=~/work/project
echo "input username or type enter to use default name"
read username
if [ "$username" = "" ]; then
    echo "you choose to use default username"
    username=$defaultname
fi
echo $username
cd $projectPath/pocketscanner
git log --pretty=format:"%an %s" --since=1.days --author=$username | grep "$username.*-" > $workspace/pocketscanner_log.txt
sed -i '' "s/$username/PocketScanner/g" $workspace/pocketscanner_log.txt
cd $projectPath/PDF_Connoisseur_Universal_source
git log --pretty=format:"%an %s" --since=1.days --author=$username | grep "$username.*-" > $workspace/Connoisseur_log.txt
sed -i '' "s/$username/Connoisseur/g" $workspace/Connoisseur_log.txt
cd $projectPath/PDFReader\_Universal\_source
git log --pretty=format:"%an %s" --since=1.days --author=$username | grep "$username.*-" > $workspace/Reader6_log.txt
sed -i '' "s/$username/PDFReader6/g" $workspace/Reader6_log.txt
cd $projectPath/Pocket_Scanner_Cloud_source
git log --pretty=format:"%an %s" --since=1.days --author=$username | grep "$username.*-" > $workspace/Scanner_log.txt
sed -i '' "s/$username/ScannerCloud/g" $workspace/Scanner_log.txt
cd $projectPath/PDF_Markup_Cloud
git log --pretty=format:"%an %s" --since=1.days --author=$username | grep "$username.*-" > $workspace/PDFCloud_log.txt
sed -i '' "s/$username/PDFCloud/g" $workspace/PDFCloud_log.txt
cat $workspace/pocketscanner_log.txt > $workspace/zhoubao.txt
cat $workspace/Connoisseur_log.txt >> $workspace/zhoubao.txt
cat $workspace/Reader6_log.txt >> $workspace/zhoubao.txt
cat $workspace/Scanner_log.txt >> $workspace/zhoubao.txt
cat $workspace/PDFCloud_log.txt >> $workspace/zhoubao.txt
vim $workspace/zhoubao.txt
