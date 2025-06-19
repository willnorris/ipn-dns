FROM --platform=$BUILDPLATFORM cgr.dev/chainguard/wolfi-base as build
RUN apk update && apk add build-base git libcap-utils openssh go-1.24

WORKDIR /work

COPY go.mod go.sum ./
RUN go mod download

COPY . .
ARG TARGETOS TARGETARCH
RUN GOOS=${TARGETOS} GOARCH="${TARGETARCH}" CGO_ENABLED=0 go build -v -o dns .
RUN setcap cap_net_bind_service=+ep dns

# Final image with just dns binary
FROM cgr.dev/chainguard/static:latest

ENV HOME /root

COPY --from=build /work/dns /dns
COPY ./Corefile /Corefile

ENTRYPOINT ["/dns"]
CMD []
