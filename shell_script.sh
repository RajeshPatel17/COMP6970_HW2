#!/bin/bash
docker build -t rrp0019_mariadb_image ./db_image/
sleep 60
docker run -p 127.0.0.1:3306:3306 --net=bridge --name rrp0019_mariadb_container -d rrp0019_mariadb_image
sleep 60
#mariadb --host=127.0.0.1 --port=3306 -u root -pPassword123!
#exit
mariadb_ip_addr=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' rrp0019_mariadb_container)
docker build -t rrp0019_flask_image ./flask_image/
sleep 60
docker run -p 127.0.0.1:5000:5000 -d -e IP_ADDR=$mariadb_ip_addr --name rrp0019_flask_container rrp0019_flask_image 
sleep 60
curl http://localhost:5000/api/people
