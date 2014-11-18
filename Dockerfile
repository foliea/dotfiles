FROM ubuntu:14.04

ENV DEV /home/dev

RUN mkdir -p $DEV

COPY scripts/ubuntu.sh .

RUN sh ubuntu.sh && \
    rm ubuntu.sh

COPY . $DEV/dotfiles

#RUN cd $DEV/dotfiles && make

WORKDIR $DEV
