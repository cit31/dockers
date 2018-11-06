#raghudevops32/s1-webservice:v2
FROM centos
RUN yum install httpd -y
RUN echo "Hello World - v2" >/var/www/html/index.html
EXPOSE 80
CMD /usr/sbin/httpd -DFOREGROUND
