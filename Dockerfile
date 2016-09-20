FROM ubuntu:16.04

ENV DEV /home/dev

ENV SKIP_APPLICATIONS true

COPY . $DEV

COPY linux/install.sh .

RUN sh install.sh && rm install.sh

WORKDIR $DEV
