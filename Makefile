VERSION ?= 0.3.0
CACHE ?= --no-cache=1
FULLVERSION ?= ${VERSION}
archs ?= i386 amd64
archsarm ?= arm64v8

.PHONY: all build buildarm publish latest publish-manifest
amd: build publish
arm: buildarm publish
build: 
	$(foreach arch,$(archs), \
		cat Dockerfile | sed "s/FROM ruby:alpine/FROM ${arch}\/ruby:alpine/g" > .Dockerfile; \
		docker build -t jaymoulin/twitter-cli:${VERSION}-$(arch) -f .Dockerfile ${CACHE} .;\
	)
buildarm:
	$(foreach arch,$(archsarm), \
		cat Dockerfile | sed "s/FROM ruby:alpine/FROM ${arch}\/ruby:alpine/g" > .Dockerfile; \
		docker build -t jaymoulin/twitter-cli:${VERSION}-$(arch) -f .Dockerfile ${CACHE} .;\
	)
publish:
	docker push jaymoulin/twitter-cli
publish-manifest:
	cat manifest.yml | sed "s/\$$VERSION/${VERSION}/g" > manifest.yaml
	cat manifest.yaml | sed "s/\$$FULLVERSION/${FULLVERSION}/g" > manifest2.yaml
	mv manifest2.yaml manifest.yaml
	manifest-tool push from-spec manifest.yaml
latest: build
	FULLVERSION=latest VERSION=${VERSION} make publish-manifest
