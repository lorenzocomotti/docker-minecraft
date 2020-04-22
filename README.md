# Minecraft Server in Docker
This repository contains the Dockerfile and associated assets for building a Minecraft server 1.15.2 Docker image

## Requirements
#### Install docker

Ubuntu / Debian

```
apt-get -y install docker.io
```

Fedora / Centos
```
yum install -y docker.io
```

#### Start the service:

```
systemctl start docker
```

#### Create directory which will hold the server world data:

```
mkdir /data
```

## Create config file

edit the `server.properties` file to customize server configuration   
In this link you can find the official documentation: [https://minecraft-it.gamepedia.com/Server.properties](https://minecraft-it.gamepedia.com/Server.properties)

## Mount Configuration

Mount configuration in container like configmap (kubernetes) or Volume (Docker only)
