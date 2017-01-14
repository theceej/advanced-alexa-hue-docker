FROM eschizoid/docker-rvm-armhf
MAINTAINER Chris Jordan <chrisj@gmail.com>

# Install additional dependencies
RUN apt-get -y install git

# Retrieve / Configure Alexa-Hue
RUN mkdir -p /usr/local/www && \
    cd /usr/local/www && \
    git clone https://github.com/theceej/advanced-alexa-hue-server.git server && \
    cd server && \
    /bin/bash -l -c "bundle install;"

ENV RACK_ENV production
EXPOSE 4567/tcp

WORKDIR /usr/local/www/server
ENTRYPOINT /bin/bash -l -c "ruby app.rb"
