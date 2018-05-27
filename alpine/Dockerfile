#####################################################
# Dockerfile to customeize NODE for GitLab Deployment
# Based on the official NODE
#####################################################

# Set the base image
FROM        node:alpine

# File Author / Maintainer
LABEL       maintainer=info@adiwit.co.th

# Change System TimeZone to Asia/Bangkok
RUN         ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# Install Bower & Grunt
RUN         npm install -g bower grunt-cli yarn && \
            echo '{ "allow_root": true }' > /root/.bowerrc