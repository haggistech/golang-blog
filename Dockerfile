FROM golang:1.20
LABEL org.opencontainers.image.source=https://github.com/haggistech/golang-blog

RUN apt-get update -y && apt-get install -y sqlite3

WORKDIR /go/src/github.com/haggistech/golang-blog
COPY . .

RUN go get -v ./...
RUN go install -v ./...

VOLUME /go/data
EXPOSE 3000

CMD ["golang-blog"]