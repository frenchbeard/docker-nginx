FROM frenchbeard/centos-dev

MAINTAINER frenchbeard <frenchbeardsec@gmail.com>

RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
    && yum update -y \
    && yum install -y nginx

ADD nginx.conf /etc/nginx/nginx.proxy.conf

ADD nginx_start.sh /nginx_start
RUN chmod 755 /nginx_start

ADD default_statics /staticfiles

EXPOSE 80

CMD ["/nginx_start"]
