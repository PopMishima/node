#####################################################
# Dockerfile to customeize NODE for GitLab Deployment
# Based on the official NODE:ALPINE
#####################################################

# Set the base image
FROM        node:alpine

# File Author / Maintainer
LABEL       maintainer=info@adiwit.co.th

# Change System TimeZone to Asia/Bangkok
RUN         ln -sf /usr/share/zoneinfo/Asia/Bangkok /etc/localtime

# SSH
RUN         apk add -U openssh-client --no-cache \
            && mkdir ~/.ssh \
            && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config \
            && rm -f /var/cache/apk/*