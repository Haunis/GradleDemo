------------------------------1.build.gradle-----------------------------------

每个project下必须有build.gradle

gradle 文档: https://docs.gradle.org/current/userguide/userguide.html

gradle常用命令:
gradle projects : 查看有多少个project

gradle abcmodule:tasks :查看abcmodule下有多少人个task
gradle tasks  如果已经在abcmodule下了,直接执行

gradle properties: 用来查看所有属性信息。

在gradle xxx中指定什么任务，gradle就会将这个xxx任务链上的所有任务全部按依赖顺序执行一遍

在gradle执行的时候，会将脚本转换成对应的对端：


在gradle执行的时候，会将脚本转换成对应的对端：
1.Gradle对象：当我们执行gradle xxx或者什么的时候，gradle会从默认的配置脚本中构造出一个Gradle对象。
    在整个执行过程中，只有这么一个对象。Gradle对象的数据类型就是Gradle。
    我们一般很少去定制这个默认的配置脚本。

    在settings.gradle 添加println "settings -->, gradle id is " +gradle.hashCode()
    可以查看其hashcode,打印结果和app/build.gradle输出一致
2.Project对象：每一个build.gradle会转换成一个Project对象。
3.Settings对象：显然，每一个settings.gradle都会转换成一个Settings对象。

------------------------------2.task-----------------------------------
https://docs.gradle.org/current/dsl/org.gradle.api.Task.html


------------------------------3.gradlew-----------------------------------
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




