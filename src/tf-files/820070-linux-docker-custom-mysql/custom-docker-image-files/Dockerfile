FROM mysql as base

ENV MYSQL_ROOT_PASSWORD=Azure123
ENV MYSQL_DATABASE=appdb

COPY 01.sql /docker-entrypoint-initdb.d/