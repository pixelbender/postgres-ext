.PHONY: build push

IMAGE := ghcr.io/pixelbender/postgres-ext:latest

build:
	docker build \
		--platform linux/amd64 \
		--progress plain \
		--build-arg PG_IVM_VERSION=1.5.1 \
		-t $(IMAGE) .

push:
	docker push $(IMAGE)
