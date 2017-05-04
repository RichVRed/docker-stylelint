# BUILD:
# docker build --force-rm --tag "rvannauker/stylelint" --file stylelint.dockerfile .
# SUGGESTED BUILD:
# docker build --force-rm --tag "rvannauker/stylelint" --file stylelint.dockerfile .
# RUN:
# docker run --rm --volume $(pwd):/src --name="stylelint" "rvannauker/stylelint"
# PACKAGE: stylelint
# PACKAGE REPOSITORY: https://github.com/stylelint/stylelint
# DESCRIPTION: stylelint - A mighty, modern CSS linter
# CONFIGURATION: https://github.com/stylelint/stylelint/blob/master/docs/user-guide/example-config.md
FROM alpine:latest
MAINTAINER Richard Vannauker <richard.vannauker@gmail.com>
# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL     org.label-schema.schema-version="1.0" \
          org.label-schema.build-date="$BUILD_DATE" \
          org.label-schema.version="$VERSION" \
          org.label-schema.name="" \
          org.label-schema.description="" \
          org.label-schema.vendor="SEOHEAT LLC" \
          org.label-schema.url="" \
          org.label-schema.vcs-ref="$VCS_REF" \
          org.label-schema.vcs-url="" \
          org.label-schema.usage="" \
          org.label-schema.docker.cmd="" \
          org.label-schema.docker.cmd.devel="" \
          org.label-schema.docker.cmd.test="" \
          org.label-schema.docker.cmd.debug="" \
          org.label-schema.docker.cmd.help="" \
          org.label-schema.docker.params="" \
          org.label-schema.rkt.cmd="" \
          org.label-schema.rkt.cmd.devel="" \
          org.label-schema.rkt.cmd.test="" \
          org.label-schema.rkt.cmd.debug="" \
          org.label-schema.rkt.cmd.help="" \
          org.label-schema.rkt.params="" \
          com.amazonaws.ecs.task-arn="" \
          com.amazonaws.ecs.container-name="" \
          com.amazonaws.ecs.task-definition-family="" \
          com.amazonaws.ecs.task-definition-version="" \
          com.amazonaws.ecs.cluster=""

ENV VERSION_STYLELINT=7.10.1
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
        && apk update \
        && apk add \
               --no-cache \
               --virtual .nodejs \
                         nodejs \
        && npm install \
               -g \
               stylelint@${VERSION_STYLELINT} \
               stylelint-config-standard \
               --save-dev \
        && rm -rf /var/cache/apk/* \
        && rm -rf /tmp/*

WORKDIR /src
VOLUME /src
ENTRYPOINT ["stylelint"]