# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

ARG GOLANG_VERSION=1.21
FROM golang:${GOLANG_VERSION}

ARG GOTOOLS="github.com/magiconair/vendorfmt/cmd/vendorfmt \
   github.com/mitchellh/gox \
   golang.org/x/tools/cmd/cover \
   golang.org/x/tools/cmd/stringer \
   github.com/axw/gocov/gocov \
   gopkg.in/matm/v1/gocov-html"

RUN for p in ${GOTOOLS}; do go install ${p}@latest; done

WORKDIR /go-build
