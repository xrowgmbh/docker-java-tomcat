FROM centos/systemd

MAINTAINER https://xrow.com

ENV container docker

RUN yum -y update && yum -y install tar gzip java java-devel && yum clean all

RUN yum -y install tomcat tomcat-native && \
    systemctl enable tomcat && \
    sed -i 's#<Connector port="8080" protocol="HTTP/1.1"#<Connector port="8080" protocol="HTTP/1.1" URIEncoding="UTF-8"#' /etc/tomcat/server.xml && \
    yum clean all

CMD ["/usr/sbin/init"]

EXPOSE 8080