FROM debian:stretch

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -yq --no-install-recommends \
	vim \
	apt-utils \
	apache2 \
	libapache2-mod-php \
	libapache2-mod-php7.0 \
	php7.0 \
	php7.0-pgsql

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

RUN a2enmod php7.0 rewrite 

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

WORKDIR /var/www/html

EXPOSE 80

CMD apachectl -D FOREGROUND
