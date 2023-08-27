FROM ubuntu:bionic
LABEL maintainder="AllanCapistrano <asantos@ecomp.uefs.br>"

WORKDIR /opt

ADD target/Virtual-FoT-Device-1.0-SNAPSHOT-jar-with-dependencies.jar ./device.jar

RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove -y\ 
	&& apt-get install openjdk-11-jdk -y\
	&& apt-get autoremove -y\
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["java", "-jar", "device.jar"]