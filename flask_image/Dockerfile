FROM python:latest
LABEL description = "This is my flask image"
MAINTAINER Rajesh Patel rrp0019@auburn.edu
USER root
EXPOSE 5000
RUN apt-get update -y && apt-get install -y build-essential
#COPY mariadb_repo_setup mariadb_repo_setup
ADD https://downloads.mariadb.com/MariaDB/mariadb_repo_setup ./mariadb_repo_setup
RUN echo "733cf126b03f73050e242102592658913d10829a5bf056ab77e7f864b3f8de1f  mariadb_repo_setup" | sha256sum -c -
RUN chmod +x mariadb_repo_setup
COPY api.py api.py
RUN ./mariadb_repo_setup
RUN apt-get install libmariadb3 libmariadb-dev -y
RUN pip install flask && \
    pip install mariadb
# RUN python3 api.py
ENTRYPOINT python3 api.py
