FROM ubuntu:latest 
MAINTAINER laijunlong1987 "laijunlong1987@gmail.com"
ENV REFRESHED_AT 2017-2-11
#安装软件
RUN apt-get update
RUN apt-get -y -q install nginx tomcat7 default-jdk supervisor
#设置软件需要的目录
RUN mkdir -p /var/www/html
RUN mkdir -p /var/log/supervisor
#配置Nginx
ADD nginx/global.conf /etc/nginx/conf.d
ADD nginx/nginx.conf /etc/nginx/nginx.conf
#配置Supervisord
COPY supervisord.conf /etc/supervisord.conf
#设置tomcat7
ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_PID /var/run/tomcat7.pid
ENV CATALINA_SH /usr/share/tomcat7/bin/catalina.sh
ENV CATALINA_TMPDIR /tmp/tomcat7-tomcat7-tmp

RUN mkdir -p $CATALINA_TMPDIR

VOLUME [ "/var/lib/tomcat7/webapps" ]

EXPOSE 80 8080
ENTRYPOINT [ "/usr/bin/supervisord" ]
