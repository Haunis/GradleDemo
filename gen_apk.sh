#!/bin/bash

#./gradlew clean assembleRelease
#./gradlew clean assembleDebug
#./gradlew clean assemble

rm app/libs/hello*
rm app/apks/*

#gradle hellolib:assemble  # 使用安装的gradle也行,gradlew是对gradle的封装
./gradlew hellolib:makeaar  # 只编译 hellolib,不编译app模块
cp hellolib/out_aar/*.aar app/libs/ #hellolib编译的aar拷贝至app使用

#./gradlew app:clean assembleRelease #build app
#./gradlew app:clean assemble #build app
./gradlew app:clean makeapk #build app
adb shell pm uninstall com.jiage.gradledemo
sleep 0.5
#adb install ./app/build/outputs/apk/debug/app-debug.apk
adb install ./app/apks/*.apk
#adb install ./app/build/outputs/apk/release/app-release-unsigned.apk
adb shell am start -n com.jiage.gradledemo/.MainActivity


