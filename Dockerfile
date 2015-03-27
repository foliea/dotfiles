FROM ubuntu:14.04

ENV DEV /home/dev

COPY linux/install.sh .

RUN sh install.sh && \
    rm install.sh

COPY . $DEV

WORKDIR $DEV
