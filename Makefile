VERSION ?= 0.3.0
CACHE ?= --no-cache=1
FULLVERSION ?= ${VERSION}
archs = i386 amd64

.PHONY: all build buildarm publish latest
all: build publish latest
build:
	cp /usr/bin/qemu-*-static .
	$(foreach arch,$(archs), \
		cat Dockerfile | sed "s/FROM ruby:alpine/FROM ${arch}\/ruby:alpine/g" > .Dockerfile; \
		docker build -t jaymoulin/twitter-cli:${VERSION}-$(arch) -f .Dockerfile ${CACHE} .;\
	)
buildarm:
	cat Dockerfile | sed "s/FROM ruby:alpine/FROM arm32v6\/ruby:alpine/g" > .Dockerfile
	docker build -t jaymoulin/twitter-cli:${VERSION}-arm32v6 -f .Dockerfile .
publish:
	docker push jaymoulin/twitter-cli
	cat manifest.yml | sed "s/\$$VERSION/${VERSION}/g" > manifest.yaml
	cat manifest.yaml | sed "s/\$$FULLVERSION/${FULLVERSION}/g" > manifest2.yaml
	mv manifest2.yaml manifest.yaml
	manifest-tool push from-spec manifest.yaml
latest: build
	FULLVERSION=latest VERSION=${VERSION} make publish
latestarm: buildarm
	FULLVERSION=latest VERSION=${VERSION} make publish
