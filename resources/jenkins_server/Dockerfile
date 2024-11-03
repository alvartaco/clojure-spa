FROM jenkins/jenkins:2.483-jdk17

USER root

RUN apt-get update 
RUN apt-get install -y sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get install -y openjdk-17-jdk
RUN apt-get install -y jq
RUN apt-get install -y curl
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein 
RUN chmod +x /usr/local/bin/lein && lein
    
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y git

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get -y install docker-ce
RUN usermod -aG docker jenkins

USER jenkins
