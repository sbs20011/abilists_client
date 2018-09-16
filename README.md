# Abilists for client

[![Build Status](https://travis-ci.org/minziappa/abilists_client.svg?branch=master)](https://travis-ci.org/minziappa/abilists_client.svg)

By Joon Kim

## About
* More [information](http://freemarker.org) about Freemarker.
* More [information](http://projects.spring.io/spring-framework) about Spring4.
* More [information](http://blog.mybatis.org) about Mybatis3
* More [information](https://www.gradle.org) about Gradle3.3.

## Requirements environment 

* [Java7](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Gradle](https://services.gradle.org/distributions/gradle-3.3-all.zip)

Using your local repositories
```
repositories {
	mavenLocal()
    mavenCentral()
}
```

You have to install on your local system.
```
compile "io.utility:validate:0.0.4"
compile "io.utility:security:0.0.1"
compile "io.utility:letter:0.0.1"
compile "io.utility:image:0.0.1"
compile "io.utility:email:0.0.1"
```
[utility](https://github.com/minziappa/utility)

## Get started

Download h2db file.
```
http://www.abilists.com/home/download
```

Execute abilists with Jetty.
```
$ gradle jettyRun
```


## Deploy
Run this on your local system with tomcat.
```
$ ssh/releaseTomcatStaging.sh
```
