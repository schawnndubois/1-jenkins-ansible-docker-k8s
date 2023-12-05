FROM  centos:latest
MAINTAINER aristidejou@gmail.com
ARG link=https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip
ARG dir=shine
#https://www.free-css.com/assets/files/free-css-templates/download/page295/antique-cafe.zip
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd zip unzip 
ADD  ${link} /var/www/html/
WORKDIR /var/www/html/
RUN unzip ${dir}.zip
RUN cp -rvf ${dir}/* .
RUN rm -rf ${dir} ${dir}.zip
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
