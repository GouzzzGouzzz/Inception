FROM debian:12.2

RUN	apt-get update -y && apt upgrade -y
RUN	apt-get install mariadb-server -y
RUN	apt-get install mariadb-client -y
COPY	50-server.cnf /tmp/50-server.cnf
COPY	/tools/entrypoint.sh /tmp/entrypoint.sh
RUN	chmod +x /tmp/entrypoint.sh
EXPOSE	3306
ENTRYPOINT ["/tmp/entrypoint.sh"]


