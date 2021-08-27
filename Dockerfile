# syntax=docker/dockerfile:1
FROM alpine:latest
EXPOSE 3569 8080

ARG CLI_VERSION=""
RUN  apk add curl && addgroup -S flow && adduser -S flow -G flow

USER flow
WORKDIR /home/flow
COPY install.sh .
ENV PATH=/home/flow/.local/bin:$PATH

RUN sh /home/flow/install.sh "$CLI_VERSION"
CMD ["flow", "emulator"]


