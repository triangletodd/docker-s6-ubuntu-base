IMAGE := $(shell basename ${PWD} | sed 's/docker-//')
USER = todd
NAME = "${USER}/${IMAGE}"

.PHONY: build push debug run release

default: build

build:
	    docker build --no-cache -t $(NAME) .

push:
	    docker push $(NAME)

debug:
	    docker run --rm -it $(NAME) /bin/bash

run:
	    docker run --rm $(NAME)

release: build push
