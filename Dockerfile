FROM ruby:alpine3.6

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apk add make g++ --update --virtual .build-deps --no-cache && gem install t && apk del make --purge .build-deps

CMD ["-"]
ENTRYPOINT ["t"]
