FROM ruby:alpine3.9

LABEL maintainer="Jay MOULIN <jaymoulin@gmail.com>"

RUN apk add make g++ --update --virtual .build-deps --no-cache && gem install t && apk del make --purge .build-deps

CMD ["-"]
ENTRYPOINT ["t"]
