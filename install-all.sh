#!/bin/sh

#stop any running services
sudo service apache2 stop
sudo service jenkins stop
sudo service nginx stop

#Java
sudo dnf update
sudo dnf install oracle-java8-installer -y

#Git and Maven
sudo dnf update
sudo dnf install git-all -y
sudo dnf install maven
sudo dnf install tree
sudo dnf install git-flow

#Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo dnf update
sudo dnf install jenkins -y

#Artifactory

wget https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-6.5.2.zip
# unzip jfrog-artifactory-oss-6.5.2.zip
unzip download_file?file_path=jfrog-artifactory-oss-6.5.2.zip
cd art*
cd bin*
sudo ./installService.sh
# sudo service artifactory start

#Docker
sudo dnf update
sudo dnf -y install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
sudo update-rc.d docker.io defaults



