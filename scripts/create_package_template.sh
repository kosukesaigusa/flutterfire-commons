#!/bin/bash

echo -n "Input package name (e.g. utils): "
read str 
cp -R ./packages/sample packages/$str
sed -i '' -e "s/sample/$str/g" ./packages/$str/pubspec.yaml
sed -i '' -e "s/sample/$str/g" ./packages/$str/test/sample_test.dart
sed -i '' -e "s/sample/$str/g" ./packages/$str/example/pubspec.yaml
sed -i '' -e "s/sample/$str/g" ./packages/$str/example/lib/main.dart
mv ./packages/$str/lib/sample.dart ./packages/$str/lib/$str.dart
mv ./packages/$str/test/sample_test.dart ./packages/$str/test/$str_test.dart
melos bootstrap
melos run pub:get
