#!/bin/bash
docker-compose stop && docker-compose rm -f
FILE=./build/Dockerfile
if [ -f $FILE ]; then
  rm $FILE
fi
cat > $FILE <<EOL
FROM mariadb:10

RUN usermod -u ${UID:-0} mysql

COPY my.cnf /etc/mysql/my.cnf
EOL
docker-compose up -d --build
