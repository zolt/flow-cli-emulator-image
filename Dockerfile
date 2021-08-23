# syntax=docker/dockerfile:1
FROM alpine:latest

RUN apk add curl
RUN addgroup -S flow-emulator && adduser -S flow-emulator -G flow-emulator
WORKDIR /home/flow-emulator
EXPOSE 3569 8080
USER flow-emulator
RUN sh -ci "$(curl -fsSL https://storage.googleapis.com/flow-cli/install.sh)"
ENV PATH=/home/flow-emulator/.local/bin:$PATH
CMD ["flow", "emulator"]


