##Download base image Ubuntu Bionic
FROM ubuntu:bionic

MAINTAINER Lorenzo Comotti

##Define the ENV variable
ENV MINECRAFT_VERSION="1.15.2"
ENV MINECRAFT_WORKDIRECTORY="/opt/minecraft/"

##Update Software repository and required pakages
RUN apt update && apt -y upgrade && apt install -y wget screen openjdk-11-jre-headless 

##Create Work-Directory and Download Minecraft Server
RUN mkdir /opt/minecraft && wget https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar -O /opt/minecraft/server.jar

##Copy coinfiguration File
COPY eula.txt ${MINECRAFT_WORKDIRECTORY}
COPY server-start.sh ${MINECRAFT_WORKDIRECTORY}

RUN chmod +x ${MINECRAFT_WORKDIRECTORY}server-start.sh

WORKDIR "/opt/minecraft" 

ENTRYPOINT [ "/opt/minecraft/server-start.sh" ]

EXPOSE 25565
EXPOSE 25575