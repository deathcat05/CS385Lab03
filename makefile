all: bin/main main run-targets
VERSION=latest
SRCDIR=src/main

bin/main: $(shell find $(SRCDIR) -name *.go)
	docker run --rm -it -v `pwd`:/usr/app \
		-w /usr/app \
		-e GOPATH=/usr/app \
		-e CGO_ENABLED=0\
		-e GOOS=linux \
		golang:1.9 sh -c 'go get main && go build -ldflags "-extldflags -static" -o $@ main'

main: bin/main
	docker build -t main:$(VERSION) .

run-targets: main 
	docker run -d -p 80:8080 --name main main:$(VERSION)

clean: 
	docker stop main
	docker rm main
	sudo rm -rf bin 	
