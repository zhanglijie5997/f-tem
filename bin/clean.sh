#!/bin/bash
###
 # @Author: zhanglijie5997 42401363+zhanglijie5997@users.noreply.github.com
 # @Date: 2023-03-20 17:37:23
 # @LastEditors: zhanglijie5997 42401363+zhanglijie5997@users.noreply.github.com
 # @LastEditTime: 2023-03-20 17:39:31
 # @FilePath: /jdn/bin/clean.sh
 # @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
### 
bin_path=$(cd `dirname $0` || exit; pwd)
cd "$bin_path" || exit
cd  ../
rootPath=$(pwd)

flutter clean 
rm -Rf "$rootPath/ios/Pods"
rm -Rf "$rootPath/ios/.symlinks"
rm -Rf "$rootPath/ios/Flutter/Flutter.framework"
rm -Rf "$rootPath/ios/Flutter/Flutter.podspec"
rm -rf "$rootPath/pubspec.lock"
rm -rf "$rootPath/ios/Podfile.lock"