.PHONY: build

build:
	docker build \
		--platform linux/amd64 \
		--progress plain \
		--build-arg PG_IVM_VERSION=1.5.1 \
		-t postgres-ext:latest .
