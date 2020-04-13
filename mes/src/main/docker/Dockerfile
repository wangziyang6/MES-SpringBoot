FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD mes-1.0.0.jar app.jar
RUN bash -c 'touch /app.jar'
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo 'Asia/Beijing' >/etc/timezone
EXPOSE 80
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]