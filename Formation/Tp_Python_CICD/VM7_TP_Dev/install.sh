#!/usr/bin/env bash

apt-get update

# Install Python

apt-get install python3 python3-dev python3-pip -q -y
apt remove -y python
#mv /usr/bin/python3 /usr/bin/python

pip3 install flask

# Install Gradle
# Install java (prérequis Gradle)

sudo apt update
sudo apt install -y openjdk-11-jdk
sudo apt install -y unzip

# Install Unzip

sudo apt install -y unzip

# Récupération de la dernière version de Gradle

VERSION=7.0
wget https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip -P /tmp

unzip -d /opt/gradle /tmp/gradle-${VERSION}-bin.zip

# Faire pointer le lien vers la dernière version de gradle

ln -s /opt/gradle/gradle-${VERSION} /opt/gradle/latest

# Ajout de gradle au PATH

touch /etc/profile.d/gradle.sh

echo "export PATH=/opt/gradle/latest/bin:${PATH}" > /etc/profile.d/gradle.sh

chmod +x /etc/profile.d/gradle.sh

source /etc/profile.d/gradle.sh