FROM ubuntu
LABEL description = "This is my flask image"
MAINTAINER Rajesh Patel rrp0019@auburn.edu
USER root
EXPOSE 5000
RUN apt update && apt upgrade
RUN apt install sudo
COPY mariadb_repo_setup mariadb_repo_setup
COPY api.py api.py
RUN sudo apt install curl ca-certificates -y
ADD https://downloads.mariadb.com/MariaDB/mariadb_repo_setup ./mariadb_repo_setup
RUN echo "733cf126b03f73050e242102592658913d10829a5bf056ab77e7f864b3f8de1f  mariadb_repo_setup" | sha256sum -c -
RUN chmod +x mariadb_repo_setup
RUN sudo ./mariadb_repo_setup --mariadb-server-version="mariadb-10.6"
RUN sudo apt install libmariadb3 libmariadb-dev -y && \
    sudo apt install python3 -y
RUN sudo apt install virtualenv -y
RUN virtualenv venv
RUN . venv/bin/activate activate
RUN pip3 install flask && \
    pip3 install mariadb
# RUN python3 api.py
ENTRYPOINT python3 api.py
