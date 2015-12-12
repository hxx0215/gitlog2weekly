#!/bin/sh
currentDir=`pwd`
workPaths=($currentDir/clang $currentDir/cmark $currentDir/llbuild $currentDir/lldb $currentDir/llvm $currentDir/swift $currentDir/swift-corelibs-foundation $currentDir/swift-corelibs-xctest $currentDir/swiftpm)
for ((i=0;i<${#workPaths[@]};i++))
do
    dir=${workPaths[i]}
    cd $dir
    git pull
    echo "$dir updated complete"
done
echo "begin to generate Xcode workspace"
cd $currentDir
swift/utils/build-script -X --skip-build -- --reconfigure
