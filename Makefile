VERSION ?= v3.1.0
CACHE ?= --no-cache=1
FULLVERSION ?= v3.1.0
archs ?= i386 amd64 arm64v8 arm32v6

.PHONY: all build publish latest publish-manifest
amd: build publish
qemu-arm-static:
	cp /usr/bin/qemu-arm-static .
qemu-aarch64-static:
	cp /usr/bin/qemu-aarch64-static .
build: qemu-aarch64-static qemu-arm-static
	$(foreach arch,$(archs), \
		cat Dockerfile | sed "s/FROM ruby:alpine/FROM ${arch}\/ruby:alpine/g" > .Dockerfile; \
		docker build -t jaymoulin/twitter-cli:${VERSION}-$(arch) -f .Dockerfile --build-arg VERSION=${VERSION} ${CACHE} .;\
	)
publish:
	docker push jaymoulin/twitter-cli -a
publish-manifest:
	cat manifest.yml | sed "s/\$$VERSION/${VERSION}/g" > manifest.yaml
	cat manifest.yaml | sed "s/\$$FULLVERSION/${FULLVERSION}/g" > manifest2.yaml
	mv manifest2.yaml manifest.yaml
	manifest-tool push from-spec manifest.yaml
latest: build
	FULLVERSION=latest VERSION=${VERSION} make publish-manifest
