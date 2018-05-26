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
            && apt-get autoremove -fy \
            && apt-get clean \
            && apt-get autoclean -y \
            && docker-php-source delete \
            && rm -rf /var/lib/apt/lists/*

# Install Bower & Grunt
RUN         npm install -g bower grunt-cli && \
            echo '{ "allow_root": true }' > /root/.bowerrc