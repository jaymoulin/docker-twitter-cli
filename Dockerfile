FROM ruby:alpine3.6 as builder

COPY qemu-*-static /usr/bin/

FROM builder

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apk add make g++ --update --virtual .build-deps --no-cache && gem install t && apk del make --purge .build-deps

CMD ["-"]
ENTRYPOINT ["t"]
