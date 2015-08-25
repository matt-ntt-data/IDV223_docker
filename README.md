# IDV223_docker

## Docker setup for build server

### Important notes

Before using this project you require a folder called ssh at the root of your project. This folder isnt included here as it has rsa keys for access to the repository. Please ask for this folder before provisioning a container

### instructions

clone this repo to a folder on your machine and ensure you have a docker-machine ready to host it. you will need to build a docker image using the Docker file as follows 

```
# assumes that the docker command is being run from the directory where the Docker file is stored
$> docker build -t <image_name> . 

# once this has completed run a container based on this image
# the below assumes the following
# - the host port 8080 is to be mapped onto port 49001
# - the jenkins_home folder is mapped to the local machine folder called local folder in the users $HOME folder
$> docker run -d -p 49001:8080 -t -v /Users/<UserName>/localFolder:/var/jenkins_home <image_name>

```
