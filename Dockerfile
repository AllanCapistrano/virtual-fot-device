FROM ubuntu:bionic
LABEL maintainder="AllanCapistrano <asantos@ecomp.uefs.br>"

ENV GATEWAY_IP=0.0.0.0 \
    DEVICE_CONDUCT=1

WORKDIR /opt

ADD target/Virtual-FoT-Device-1.0-SNAPSHOT-jar-with-dependencies.jar ./device.jar
ADD run.sh run.sh

RUN chmod +x run.sh
RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove -y\ 
    && apt-get install net-tools -y\
	&& apt-get install iproute2 -y\
	&& apt-get install iputils-ping -y\
	&& apt-get install openjdk-11-jdk -y\
	&& apt-get autoremove -y\
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/bin/bash", "./run.sh"]