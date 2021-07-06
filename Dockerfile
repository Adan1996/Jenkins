FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install git -y
RUN mkdir /opt/maven && cd /opt/maven
RUN wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
RUN tar -xvzf apache-maven-3.8.1-bin.tar.gz
RUN ln -s /opt/apache-maven-3.8.1-bin.tar.gz /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
ENV MAVEN_HOME /opt/maven

RUN chown -R jenkins:jenkins /opt/maven

RUN apt-get clean

USER jenkins
# RUN usermod -aG sudo jenkins