
FROM golang:1.22.2 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o tracker

FROM debian:stable-slim
WORKDIR /root/
COPY --from=builder /app/tracker .

CMD ["./tracker"]
