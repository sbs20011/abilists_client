# Abilists for client

By Joon Kim

## About
* More [information](http://freemarker.org) about Freemarker.
* More [information](http://projects.spring.io/spring-framework) about Spring4.
* More [information](http://blog.mybatis.org) about Mybatis3
* More [information](https://www.gradle.org) about Gradle3.3.

## Requirements environment 

* [Java7,8](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Gradle3.3](https://services.gradle.org/distributions/gradle-3.3-all.zip)

Using your local repositories
```
repositories {
    mavenLocal()
    mavenCentral()
}
```

You have to install on your local system.[utility](https://github.com/minziappa/utility)
```
compile "io.utility:validate:0.0.4"
compile "io.utility:security:0.0.1"
compile "io.utility:letter:0.0.1"
compile "io.utility:image:0.0.1"
compile "io.utility:email:0.0.1"
```

## Get started

* Download h2db file  
[http://www.abilists.com/home/download](http://www.abilists.com/home/download) from [Abilists.com](http://www.abilists.com).

Execute abilists with Jetty.
```
$ gradle jettyRun
```


## Deploy
Run this on your local system with tomcat.
```
$ ssh/releaseTomcatStaging.sh
```
