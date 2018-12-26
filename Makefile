TAG_NAME=$(shell git describe --abbrev=0 --tags)
BUILD_NAME=nie-api

get:
	go get -u github.com/gin-gonic/gin/...

run:
	go run main.go

init:
	mkdir dist

build-mac:  init
	GOOS=darwin GOARCH=amd64 go build -o dist/$(BUILD_NAME)-darwin-amd64-$(TAG_NAME)

build-lin:  init
	GOOS=linux GOARCH=amd64 go build -o dist/$(BUILD_NAME)-linux-amd64-$(TAG_NAME)

build-win:  init
	GOOS=windows GOARCH=amd64 go build -o dist/$(BUILD_NAME)-windows-amd64-$(TAG_NAME)

build: build-mac    build-lin   build-win

test:
	go test -v

lint:
	golint

format:
	go fmt

fix:
	go fix

clean-dist:
	rm -rf dist

clean:  clean-dist
