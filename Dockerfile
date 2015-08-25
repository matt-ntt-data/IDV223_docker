FROM jenkins
USER root

# update apt repository and ensure a few key utilities are available to the shell
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get install -y gradle

# set up public key and run a key-scan to add entry to known_hosts for github.com
RUN mkdir /root/.ssh/
ADD ssh/ /root/.ssh/
RUN ssh-keyscan -H github.com > /root/.ssh/known_hosts
RUN chmod 600 /root/.ssh/

# set up plugins required by Jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# set up directory and clone git project into it
RUN mkdir -p /usr/share/code/
RUN cd /usr/share/code/
RUN git clone git@github.com:tescomobile-dev/idv.git

