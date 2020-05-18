# Minecraft Server in Docker
This repository contains the Dockerfile and associated assets for building a Minecraft server 1.15.2 Docker image

### Requirements
#### Install docker

Fedora / Centos
```
yum install -y docker.io
```

Ubuntu / Debian

```
apt-get -y install docker.io
```

#### Create a directory for your world file, configuration, and logs

```
mkdir -p $HOME/minecraft/worlds
mkdir -p $HOME/minecraft/configurations
```

## Create config file

Create or edit the `$HOME/minecraft/configurations/server.properties` file to customize server configuration.  
In this link you can find the official documentation: [https://minecraft-it.gamepedia.com/Server.properties](https://minecraft-it.gamepedia.com/Server.properties)

## Start your docker container

```
sudo docker run -it -p 25565:25565 -v $HOME/minecraft/worlds:/opt/minecraft/worlds -v $HOME/minecraft/configurations/serverconfig.txt:/opt/minecraft/serverconfig.txt --name="minecraft" lorenzocomotti/docker-minecraft:latest
```

If you also want to use RCON, you must also expose the following port `25575`
