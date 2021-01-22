gradle文档:
https://docs.gradle.org/current/dsl/index.html

------------------------------1.project概念-----------------------------------
每个待编译的工程叫project,每个project目录下必须有build.gradle文件

每一个Project在构建的时候都包含一系列的Task。
比如一个Android APK的编译可能包含：Java源码编译Task、资源编译Task、JNI编译Task、lint检查Task、打包生成APK的Task、签名Task等。

multi projects:　目录下必须配置settings.gradle,一般也配置build.gradle

编译某个project的话,cd到该目录(该目录必须含有build.gradle),执行 gradle assemble

------------------------------2.Script Block概念-----------------------------------
https://docs.gradle.org/current/dsl/index.html
build.grade文件里的一些方法,如allprojects { },buildscript { }等

这些Script Block实际上是个方法,方法里是闭包,可以在下述页面搜索到.
https://docs.gradle.org/current/javadoc/index-all.html

buildscript:
    它的closure是在一个类型为ScriptHandler的对象上执行的。主意用来所依赖的classpath等信息。
    通过查看ScriptHandler API可知，在buildscript SB中，可以调用ScriptHandler提供的
    repositories(Closure )、dependencies(Closure)函数。
    这也是为什么repositories和dependencies两个SB为什么要放在buildscript的花括号中的原因

------------------------------3.gradle-----------------------------------
gradle 文档: https://docs.gradle.org/current/userguide/userguide.html

生命周期:https://docs.gradle.org/current/userguide/build_lifecycle.html
build.gradle执行流程: 1.setting.gradle --> 2.每个工程下的build.gradle --> 3.执行这些task

gradle常用命令:
    gradle projects : 查看multi projects到底包含多少个子Project
    gradle abcmodule:tasks :查看abcmodule下有多少人个task
    gradle tasks  如果已经在abcmodule下了,直接执行
    gradle properties: 用来查看所有属性信息。

执行某个task: gradle task_name,如:
    gradle assemble: 编译该project
    gradle app:assemble
    gradle hellolib:assemble
    gradle clean:删除build目录

在gradle xxx中指定什么任务，gradle就会将这个xxx任务链上的所有任务全部按依赖顺序执行一遍

在gradle执行的时候，会将脚本转换成对应的对象：
    1.Gradle对象：当我们执行gradle xxx或者什么的时候，gradle会从默认的配置脚本中构造出一个Gradle对象。
        在整个执行过程中，只有这么一个对象。Gradle对象的数据类型就是Gradle。一般很少去定制这个默认的配置脚本。
        在settings.gradle 添加println "settings -->, gradle id is " +gradle.hashCode()
        可以查看其hashcode,打印结果和app/build.gradle输出一致
    2.Project对象：每一个build.gradle会转换成一个Project对象。
    3.Settings对象：显然，每一个settings.gradle都会转换成一个Settings对象。
    对于其他gradle文件，除非定义了class，否则会转换成一个实现了Script接口的对象。

对象说明:
    gradle: 整个build过程的唯一对象
    rootProject: 根目录build.gradle
    project: 各个工程的build.gradle


------------------------------4.gradlew-----------------------------------
gradlew
常用命令:
https://blog.csdn.net/zhihui_520/article/details/53783347
https://www.jianshu.com/p/db62617cbbff
    gradlew -v 版本号
    gradlew clean 清除工程目录下的build文件夹
    gradlew build 检查依赖并编译打包
    gradlew assembleDebug 编译并打Debug包
    gradlew assembleRelease 编译并打Release的包

多渠道打包
    https://blog.csdn.net/ddddwwww2/article/details/53085537
    1、全渠道release版本打包：./gradlew assembleRelease
    2、全渠道debug版本打包：./gradlew assembleDebug
    3、单个渠道release版本打包：./gradlew assembleGoogleRelease
    4、单个渠道debug版本打包：./gradlew assembleGoogleDebug
    5、单个渠道打包：./gradlew assembleGoogle
        这个会生成release和debug两个版本的apk

------------------------------5.task-----------------------------------
https://docs.gradle.org/current/dsl/org.gradle.api.Task.html

task介绍
https://blog.csdn.net/u011077027/article/details/103184087
https://blog.csdn.net/u011077027/article/details/103186771

task delete所有文件
https://www.cnblogs.com/androiddream/p/7880584.html

