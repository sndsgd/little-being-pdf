CWD = $(shell pwd)
DOCKER = $(shell which docker | cut -f 1)
IMAGE_NAME ?= sndsgd/little-being-pdf
WHOMST ?= example

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) -f code/Dockerfile .

.PHONY: pdf
pdf: build
	docker run --rm -it -v $(CWD)/$(WHOMST):/var/whomst $(IMAGE_NAME) /var/code/mkpdf
