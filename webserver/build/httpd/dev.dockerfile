FROM debian:jessie

RUN apt-get update && apt-get install -y apache2 && apt-get clean

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN mkdir -p /var/log/supervisor

RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

EXPOSE 80

CMD tail -f /dev/null
