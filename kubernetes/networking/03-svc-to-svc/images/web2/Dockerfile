#raghudevops32/nw-web02:latest
FROM centos
RUN yum install httpd -y
RUN echo web02 >/var/www/html/index.html
CMD /usr/sbin/httpd -DFOREGROUND
