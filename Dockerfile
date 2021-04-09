# Alpine image.
FROM debian:10.9 AS target

## Install dependencies.
RUN apt-get update && apt-get install -y \
    curl \
    openjdk-8-jdk &&\
    unzip \
    rm -rf /var/lib/apt/lists/*

## Set app directory.
ENV APP_DIR=/opt/app

## Add the vdbench file to the image.
ADD ./vdbench*.zip ./
RUN unzip -q vdbench*.zip

CMD ["vdbench"]
