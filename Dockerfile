FROM daocloud.io/ubuntu 
MAINTAINER adware
ENV REFRESHED_AT 2016-1-24
RUN apt-get update
RUN apt-get -y -q install nginx tomcat7 default-jdk
RUN mkdir -p /var/www/html
ADD nginx/global.conf /etc/nginx/conf.d
ADD nginx/nginx.conf /etc/nginx/nginx.conf

#设置tomcat7
ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_PID /var/run/tomcat7.pid
ENV CATALINA_SH /usr/share/tomcat7/bin/catalina.sh
ENV CATALINA_TMPDIR /tmp/tomcat7-tomcat7-tmp

RUN mkdir -p $CATALINA_TMPDIR

VOLUME [ "/var/lib/tomcat7/webapps" ]

EXPOSE 80
EXPOSE 8080

ENTRYPOINT [ "/usr/share/tomcat7/bin/catalina.sh","run" ]
