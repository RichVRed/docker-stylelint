.PHONY: default build build_latest push debug run microbadge_hook bin release
TAG = rvannauker/stylelint
VERSION = 1.0.0
FILE_NAME = stylelint.dockerfile
DESTINATION = $$PWD
DEBUG_COMMAND = /bin/bash
MICROBADGE_HOOK_URL = https://hooks.microbadger.com/images/rvannauker/stylelint/aPt9xMZMkwRxYFRaSbiYEeBFtpE=
HOME_BIN = ${HOME}/bin

default: build

build:
	docker build \
	       --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg VERSION="$(VERSION)" \
	       --force-rm \
	       --tag "$(TAG):$(VERSION)" \
	       --file "$(FILE_NAME)" \
	       $$PWD

build_latest:
	docker build \
	       --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
	       --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
	       --build-arg VERSION="latest" \
	       --force-rm \
	       --tag "$(TAG):latest" \
	       --file "$(FILE_NAME)" \
	       $$PWD

push:
	docker push $(TAG)

debug:
	docker run \
	       --rm \
	       --interactive \
	       "$(TAG)$(VERSION)" $(DEBUG_COMMAND)

run:
	@docker run \
	       --rm \
           --volume $$PWD:/workspace \
           --name "stylelint" \
           "$(TAG):$(VERSION)" \
           --color \
           --formatter="verbose" \
           --syntax="scss" \
           --allow-empty-input
microbadge_hook:
	curl -X POST $(MICROBADGE_HOOK_URL)

bin:
	if [ -f "${HOME_BIN}/stylelint" ]; then rm -f "${HOME_BIN}/stylelint"; fi
	echo '#!/usr/bin/env bash' > "${HOME_BIN}/stylelint"
	echo '/usr/bin/docker run --rm --volume $$(pwd):/src --name="stylelint" "rvannauker/stylelint" "$$@"' >> "${HOME_BIN}/stylelint"
	chmod 100 "${HOME_BIN}/stylelint"

release: build build_latest push bin microbadge_hook
