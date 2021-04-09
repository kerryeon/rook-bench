# Alpine image.
FROM ubuntu:20.04 AS target

## Install dependencies.
RUN apt-get update && apt-get install -y \
    curl \
    openjdk-8-jdk \
    unzip \
    vim &&\
    rm -rf /var/lib/apt/lists/*

## Set app directory.
WORKDIR /opt/app

## Add the files to the image.
ADD ./vdbench*.zip ./script.conf ./

## Unzip the vdbench files
RUN unzip -q vdbench*.zip &&\
    rm vdbench*.zip

CMD ["./vdbench", "-f", "script.conf", "-o", "output"]
