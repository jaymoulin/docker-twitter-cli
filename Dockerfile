FROM ruby:alpine

ARG VERSION=v4.1.1
ARG TARGETPLATFORM
LABEL maintainer="Jay MOULIN <https://jaymoulin.me>"
LABEL version="${VERSION}-${TARGETPLATFORM}"

RUN apk add make g++ --update --virtual .build-deps --no-cache && gem install t && apk del make --purge .build-deps

CMD ["-"]
ENTRYPOINT ["t"]
