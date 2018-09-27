FROM golang:1.9 as builder

COPY . src/

EXPOSE 80

WORKDIR src/

RUN go build -o main .

CMD ["src/main"]



