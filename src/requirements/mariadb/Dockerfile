FROM debian:buster

RUN apt update && apt upgrade && apt-get install mariadb-server -y && apt install systemd -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh	/script.sh

COPY .env .env

ENTRYPOINT [ "bash", "script.sh" ]