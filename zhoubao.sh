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
workPaths=($projectPath/pocketscanner $projectPath/PDFReader\_Universal\_source $projectPath/PDF_Connoisseur_Universal_source $projectPath/Pocket_Scanner_Cloud_source $projectPath/PDF_Markup_Cloud $projectPath/PDFReader_iPad $projectPath/PDFReader_iPhone)
nameArr=(PocketScanner PDFReader6 Connoisseur ScannerCloud PDFCloud PDFReader_iPad PDFReader_iPhone)
echo " " > $workspace/zhoubao.txt
for ((i=0;i<${#workPaths[@]};i++))
do
    path=${workPaths[i]}
    name=${nameArr[i]}
    echo $path $name
    cd $path
    git log --pretty=format:"%an %s" --since=1.days --author=$username | grep "$username.*-" > $workspace/${name}"_log.txt"
    sed -i '' "s/$username/$name/g" $workspace/${name}"_log.txt"
    cat $workspace/${name}"_log.txt" >> $workspace/zhoubao.txt
done
pbcopy < $workspace/zhoubao.txt
vim $workspace/zhoubao.txt
