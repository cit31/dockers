#raghudevops32/nw-web01:latest
FROM centos
RUN yum install httpd -y
RUN echo web01 >/var/www/html/index.html
CMD /usr/sbin/httpd -DFOREGROUND
