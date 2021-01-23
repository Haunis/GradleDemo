#!/bin/bash

#./gradlew clean assembleRelease
#./gradlew clean assembleDebug
#./gradlew clean assemble

rm app/libs/hello*
rm app/apks/*
rm hellolib/out_aar/*

#gradle hellolib:assemble  # build hellolib ;这个也ok,但是gradle是系统的程序
./gradlew hellolib:makeaar  # 只编译 hellolib,不编译app模块
cp hellolib/out_aar/*.aar app/libs/ #hellolib编译的aar拷贝至app使用

#./gradlew app:clean assembleRelease #build app
./gradlew app:clean assemble #build app
adb shell pm uninstall com.jiage.gradledemo
sleep 0.5
adb install ./app/build/outputs/apk/debug/app-debug.apk
#adb install ./app/build/outputs/apk/release/app-release-unsigned.apk
adb shell am start -n com.jiage.gradledemo/.MainActivity


