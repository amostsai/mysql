FROM amostsai/ubuntu_base

MAINTAINER Amos Tsai <amos.tsai@gmail.com>

ENV DEBIAN_FRONTEND noninteractive \
	MYSQL_USER=mysql \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

RUN \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get install -y mysql-server

RUN	\
	# Clean up
	rm -rf ${MYSQL_DATA_DIR} && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	apt-get autoremove -y && \
	apt-get clean
	

#VOLUME /var/lib/mysql
VOLUME ["${MYSQL_DATA_DIR}", "${MYSQL_RUN_DIR}"]

EXPOSE 3306

CMD ["mysqld_safe"]