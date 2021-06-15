FROM ubuntu:18.04

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        wget perl && \
        rm -rf /var/lib/apt/lists/*

ENV IMPLY_VERSION 2021.03
RUN wget -qO- https://static.imply.io/release/imply-${IMPLY_VERSION}.tar.gz | tar -xzf - \
    --exclude=imply-${IMPLY_VERSION}/conf \
    --exclude=imply-${IMPLY_VERSION}/conf-quickstart \
    --exclude=imply-${IMPLY_VERSION}/dist/druid \
    --exclude=imply-${IMPLY_VERSION}/dist/pivot/macos

RUN mv imply-${IMPLY_VERSION} imply
EXPOSE 9095