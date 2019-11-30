##Download base image ubuntu Centos 7
FROM ubuntu:bionic

MAINTAINER Lorenzo Comotti

##Define the ENV variable
ENV MINECRAFT_VERSION="1.14.4"
ENV MINECRAFT_WORKDIRECTORY="/opt/minecraft/"

##Update Software repository
RUN apt update && apt -y upgrade

##Install required pakages
RUN apt install wget screen openjdk-11-jre-headless -y

##Create Work-Directory
RUN mkdir /opt/minecraft

## Download Minecraft Server
RUN wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar -O /opt/minecraft/server.jar

##Copy coinfiguration File
COPY eula.txt ${MINECRAFT_WORKDIRECTORY}
COPY server-start.sh ${MINECRAFT_WORKDIRECTORY}

RUN chmod +x ${MINECRAFT_WORKDIRECTORY}server-start.sh

WORKDIR "/opt/minecraft" 

ENTRYPOINT [ "/opt/minecraft/server-start.sh" ]

EXPOSE 25565
EXPOSE 25575
