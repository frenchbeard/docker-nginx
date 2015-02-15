FROM frenchbeard/centos-dev:latest

MAINTAINER frenchbeard <frenchbeardsec@gmail.com>

RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum update -y && yum install -y nginx

ADD nginx_start.sh /nginx_start
RUN chmod 755 

VOLUME ["/etc/nginx"]
VOLUME ["/var/log/nginx"]
VOLUME ["/var/lib/nginx"]

CMD ["/nginx_start"]
