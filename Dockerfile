##Download base image Ubuntu Noble
FROM ubuntu:noble

MAINTAINER Lorenzo Comotti

##Define the ENV variable
ENV MINECRAFT_VERSION="1.21.5"
ENV MINECRAFT_WORKDIRECTORY="/opt/minecraft/"

##Update Software repository and required pakages
RUN apt update && apt -y upgrade && apt install -y wget screen openjdk-17-jre-headless 

##Create Work-Directory and Download Minecraft Server
RUN mkdir /opt/minecraft && wget https://piston-data.mojang.com/v1/objects/e6ec2f64e6080b9b5d9b471b291c33cc7f509733/server.jar -O /opt/minecraft/server.jar

##Copy coinfiguration File
COPY eula.txt ${MINECRAFT_WORKDIRECTORY}
COPY server-start.sh ${MINECRAFT_WORKDIRECTORY}

RUN chmod +x ${MINECRAFT_WORKDIRECTORY}server-start.sh

WORKDIR "/opt/minecraft" 

ENTRYPOINT [ "/opt/minecraft/server-start.sh" ]

EXPOSE 25565
EXPOSE 25575
