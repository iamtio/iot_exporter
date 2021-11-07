FROM golang:1.16-alpine3.14 as build
WORKDIR /builddir
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build .

FROM alpine:3.14
WORKDIR /opt/iot_exporter
COPY --from=build /builddir/iot_exporter .
CMD ./iot_exporter