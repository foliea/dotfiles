FROM base/archlinux:2015.06.01

ENV DEV /home/dev

COPY os/arch/pacman.conf .

RUN useradd dev && \
    cat pacman.conf >> /etc/pacman.conf && \
    rm pacman.conf && \
    pacman -Syu --noconfirm yaourt

COPY os/arch/dependencies.sh .

RUN sh dependencies.sh && rm dependencies.sh

COPY . $DEV

WORKDIR $DEV
