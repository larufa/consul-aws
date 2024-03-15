GIT_COMMIT   ?= $(shell git rev-parse --short HEAD)
GIT_IMPORT   := github.com/hashicorp/consul-aws/version
GIT_DESCRIBE ?= $(shell git describe --tags --always)

GOLDFLAGS = -X $(GIT_IMPORT).GitCommit=$(GIT_COMMIT) -X $(GIT_IMPORT).GitDescribe=$(GIT_DESCRIBE) -X $(GIT_IMPORT).VersionPrerelease=""

export GIT_COMMIT
export GIT_IMPORT
export GIT_DESCRIBE

all:
	@cat $(MAKEFILE_LIST)

tools:
	go install github.com/goreleaser/goreleaser@latest

test:
	go test ./...

vet:
	go vet ./...

fmt:
	go fmt ./...

build: fmt test vet
	go build -o consul-aws -ldflags "$(GOLDFLAGS)"

snapshot:
	goreleaser release --snapshot --clean

release:
	goreleaser release --clean
