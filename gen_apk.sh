#!/bin/bash

#./gradlew clean assembleRelease
#./gradlew clean assembleDebug
#./gradlew clean assemble


#gradle hellolib:assemble  # build hellolib ;这个也ok,但是gradle是系统的程序
./gradlew hellolib:assemble  # build hellolib
cp hellolib/build/outputs/aar/hellolib-debug.aar app/libs/

./gradlew app:clean assemble #build app

adb shell pm uninstall com.jiage.gradledemo
adb install ./app/build/outputs/apk/debug/app-debug.apk

adb shell am start -n com.jiage.gradledemo/.MainActivity


