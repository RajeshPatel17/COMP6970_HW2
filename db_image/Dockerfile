FROM mariadb
LABEL description = "This is my mariadb dockerfile"
MAINTAINER Rajesh Patel rrp0019@auburn.edu 
EXPOSE 3306
ENV MARIADB_ROOT_PASSWORD=Password123!
ENV MARIADB_DATABASE demo
USER root
COPY ./sql-scripts/ /docker-entrypoint-initdb.d/ 
# RUN mariadb --host 127.0.0.1 -P 3306 --user root -pPassword123! < createdb.sql
