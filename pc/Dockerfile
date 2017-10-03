FROM alpine

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apk add ruby-dev ruby ruby-rdoc ruby-irb make g++ --update && gem install t

CMD ["-"]
ENTRYPOINT ["t"]
