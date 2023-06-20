#!/bin/bash
bin_path=$(cd `dirname $0` || exit; pwd)
cd "$bin_path" || exit
cd  ../
rootPath=$(pwd)

dart "$rootPath/bin/theme.bin.dart"
dart format $rootPath/lib/constants/base.theme.dart 