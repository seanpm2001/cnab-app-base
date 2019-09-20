ARG ARCH=arm32v7
FROM $ARCH/alpine:3.9.4 as invocation
RUN apk add --no-cache ca-certificates && adduser -S cnab
USER cnab
COPY cnab-run /cnab/app/run
WORKDIR /cnab/app
CMD /cnab/app/run
