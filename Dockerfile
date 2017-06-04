FROM ctarwater/armhf-alpine-rpi-base

RUN apk update && apk add ruby-dev ruby ruby-rdoc ruby-irb make g++ && gem install t

CMD ["-"]
ENTRYPOINT ["t"]
