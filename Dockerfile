# syntax=docker/dockerfile:1
FROM ubuntu:latest
EXPOSE 3569 8080
ARG CLI_VERSION=""
RUN apt-get update -y && apt-get install -y curl
RUN sh -ci "$(curl -fsSL https://storage.googleapis.com/flow-cli/install.sh)"

ENV PATH=/root/.local/bin:$PATH

WORKDIR /root
CMD ["bash"]


