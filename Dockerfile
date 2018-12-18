FROM ubuntu:18.04
MAINTAINER Kaleidos hello@kaleidos.net
WORKDIR /

# Install dependencies
RUN apt-get update
RUN apt-get install -y -qq curl python3-pip vim
RUN pip3 install virtualenv

# Install requirements
RUN virtualenv -p python3 myvenv
COPY requirements.txt /conversando-server/
RUN /myvenv/bin/easy_install --upgrade requests
RUN /myvenv/bin/pip install -r /conversando-server/requirements.txt

# Setup the application
COPY . /conversando-server

WORKDIR /conversando-server
