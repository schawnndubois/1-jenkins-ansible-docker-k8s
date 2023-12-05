FROM  centos:latest
MAINTAINER aristidejou@gmail.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd zip unzip 
#ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip mediplus-lite.zip
RUN cp -rvf mediplus-lite/* .
RUN rm -rf mediplus-lite mediplus-lite.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22


# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
#  ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/           254
#  WORKDIR /var/www/html/
#  RUN unzip shine.zip                 photogenic.zip
#  RUN cp -rvf shine/* .               photogenic/* .
#  RUN rm -rf shine shine.zip          photogenic photogenic.zip
#  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#  EXPOSE 80
