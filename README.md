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
### running the instance and setting up builds

On running the docker container, assuming the docker-machine has an IP of 192.168.100.100 the url to connect to, to get to the jenkins dashboard, would be http://192.168.99.100:49001/  (as the port 49001 is mapped to the default jenkins port of 8080 in the run statement above)

When in Jenkins when you add git as your SCM repository you will need to add the ssh url for the git repository 

You will need to set up a pass to use SSH with private key, the key should already be set up assuming it has been acquired and used as detailed in the important notes section.

When you add this combination just select the option 

"From the Jenkins master ~/.ssh"

The keys are already set up so git connectivity should work automatically 
__DO NOT__ enter a username and password. If this does not work, seek help

