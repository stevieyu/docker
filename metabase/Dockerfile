FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache axel openjdk8 && \
	axel http://downloads.metabase.com/v0.32.8/metabase.jar

# java -Duser.country=CN "-Duser.language=zh -jar metabase.jar
CMD ["java", "-Duser.country=CN", "-Duser.language=zh", "-jar", "metabase.jar"]