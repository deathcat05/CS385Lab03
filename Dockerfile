from alpine:3.8

COPY bin/main  /src/

CMD ["/src/main"]
