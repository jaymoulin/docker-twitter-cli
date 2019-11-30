FROM ruby:alpine3.9

ARG VERSION=0.3.2
LABEL maintainer="Jay MOULIN <jaymoulin@gmail.com>"
LABEL version="${VERSION}"


COPY qemu-* /usr/bin/
RUN apk add make g++ --update --virtual .build-deps --no-cache && gem install t && apk del make --purge .build-deps

CMD ["-"]
ENTRYPOINT ["t"]
