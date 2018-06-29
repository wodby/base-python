-include env_make

PYTHON_VER ?= 2.7.15
ALPINE_VER ?= 3.7

REPO = wodby/base-python
NAME = base-python-$(PYTHON_VER)

ifeq ($(TAG),)
    ifeq ($(PYTHON_DEBUG),)
        TAG := $(PYTHON_VER)
    else
        TAG := $(PYTHON_VER)-debug
        NAME := $(NAME)-debug
    endif
endif

ifeq ($(BASE_IMAGE_STABILITY_TAG),)
    BASE_IMAGE_TAG := $(ALPINE_VER)
else
    BASE_IMAGE_TAG := $(ALPINE_VER)-$(BASE_IMAGE_STABILITY_TAG)
endif

.PHONY: build test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) \
		-f Dockerfile.wodby \
		--build-arg PYTHON_DEBUG=$(PYTHON_DEBUG) \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) ./

test:
	echo "no tests"

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
