##Download base image Ubuntu Focal
FROM ubuntu:focal

MAINTAINER Lorenzo Comotti

##Define the ENV variable
ENV MINECRAFT_VERSION="1.19"
ENV MINECRAFT_WORKDIRECTORY="/opt/minecraft/"

##Update Software repository and required pakages
RUN apt update && apt -y upgrade && apt install -y wget screen openjdk-17-jre-headless 

##Create Work-Directory and Download Minecraft Server
RUN mkdir /opt/minecraft && wget https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar -O /opt/minecraft/server.jar

##Copy coinfiguration File
COPY eula.txt ${MINECRAFT_WORKDIRECTORY}
COPY server-start.sh ${MINECRAFT_WORKDIRECTORY}

RUN chmod +x ${MINECRAFT_WORKDIRECTORY}server-start.sh

WORKDIR "/opt/minecraft" 

ENTRYPOINT [ "/opt/minecraft/server-start.sh" ]

EXPOSE 25565
EXPOSE 25575
