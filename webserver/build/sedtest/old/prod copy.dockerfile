FROM debian:stretch

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -yq --no-install-recommends \
    vim \
	apt-utils \
    nginx

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD rm /etc/nginx/sites-enabled/default

CMD rm /etc/nginx/sites-available/default

COPY ./production/default-site /etc/nginx/sites-available/default

CMD ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

CMD nginx -s reload

# CMD ["nginx", "-g", "daemon off;"]

CMD /etc/init.d/php7.0-fpm restart && nginx -g "daemon off;"
