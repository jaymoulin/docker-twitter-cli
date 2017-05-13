FROM resin/rpi-raspbian

RUN apt-get update && apt-get install build-essential ruby-dev ruby make gcc -y && gem install t 
