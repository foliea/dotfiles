FROM ubuntu:14.04

ENV DEV /home/dev

COPY ubuntu/install.sh .

RUN sh install.sh && \
    rm install.sh

COPY . $DEV/dotfiles

WORKDIR $DEV/dotfiles
