#!/bin/bash

#./gradlew clean assembleRelease
#./gradlew clean assembleDebug
#./gradlew clean assemble


#gradle hellolib:assemble  # build hellolib ;这个也ok,但是gradle是系统的程序
./gradlew hellolib:assemble  # 只编译 hellolib,不编译app
rm app/libs/hello*
cp hellolib/out_aar/*.aar app/libs/

./gradlew app:assemble #build app

adb shell pm uninstall com.jiage.gradledemo
sleep 0.5
adb install ./app/build/outputs/apk/debug/app-debug.apk
adb shell am start -n com.jiage.gradledemo/.MainActivity


