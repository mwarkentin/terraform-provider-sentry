GOFILES = $(shell find . -name '*.go' -not -path './vendor/*')
GOPACKAGES = $(shell go list ./...  | grep -v /vendor/)

.PHONE: all
all: test

.PHONY: test
test: test-all

.PHONY: test-all
test-all:
	@TF_ACC=1 go test -v -race $(GOPACKAGES)
