#####################################################
# Dockerfile to customeize NODE for GitLab Deployment
# Based on the official NODE
#####################################################

# Set the base image
FROM        node:stretch

# File Author / Maintainer
LABEL       maintainer=info@adiwit.co.th

# Environmental Variables
ARG         DEBIAN_FRONTEND=noninteractive

# Change System TimeZone to Asia/Bangkok
RUN         ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# Update Repositories
RUN         apt-get update --fix-missing \
            && apt-get upgrade -fy \
            && apt-get dist-upgrade -fy \
            && apt-get install --no-install-recommends -fy \
                autoconf \
                pkg-config \
                apt-utils \
                apt-transport-https \
                git \
                wget \
            && apt-get autoremove -fy \
            && apt-get clean \
            && apt-get autoclean -y \
            && rm -rf /var/lib/apt/lists/*

# Install Dependencies
RUN         npm install -g npm \
                bower \
                grunt-cli \
                yarn \
                express \
                https \
                fs \
                crypto \
                socket.io \
            && echo '{ "allow_root": true }' > /root/.bowerrc
