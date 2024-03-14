# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

FROM golang:1.21 as builder
ARG GIT_COMMIT
ARG GIT_DIRTY
ARG GIT_DESCRIBE
ENV CONSUL_DEV=1
ENV COLORIZE=0
Add . /opt/build
WORKDIR /opt/build
RUN make

FROM hashicorp/consul:latest

COPY --from=builder /opt/build/bin/consul-aws /bin
