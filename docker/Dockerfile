# ref: https://hub.docker.com/r/imankulov/leproxy
FROM golang:1.16.3 as builder
RUN git clone https://github.com/FlandreDaisuki/leproxy.git
WORKDIR /go/leproxy
RUN CGO_ENABLED=0 GOOS=linux \
    go build -ldflags="-s -w" -installsuffix=nocgo -o=/tmp/leproxy

FROM alpine:3.13.5
WORKDIR /root
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /tmp/leproxy ./leproxy
VOLUME [ "/var/cache/letsencrypt" ]
COPY ./start.sh ./start.sh
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["./start.sh"]
# ENTRYPOINT ["./leproxy", "-http=:80", "-addr=:443"]
