# JDWS
容器级别的服务实例
可以快速进行项目部署，需要配置根目录下的nginx配置文件，指向本实例服务域名或者IP地址。
内置Tomcat可以自动运行JavaEE项目。用户流量通过Nginx转发到Tomcat实现一个快速部署实例。
此弹性云镜像完全模拟JD生产环境。但是不是JD生产环境。
使用的时候需要做出一定的修改。
EXPOSE 端口Debug完成后需要关闭8080端口。
TOMCAT 配置还需要继续调整为生产环境的TOMCAT配置
