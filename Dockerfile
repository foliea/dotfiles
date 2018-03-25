FROM base/devel:latest

RUN echo '[archlinuxfr]' >> /etc/pacman.conf && \
    echo 'SigLevel = Never' >> /etc/pacman.conf && \
    echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf && \
    pacman -Syu --noconfirm yaourt

ENV APP=/dotfiles

COPY . $APP

RUN useradd --create-home --home-dir $HOME/dev dev && \
    chown -R dev:dev $HOME && \
    chown -R dev:dev $APP  && \
    echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev

USER dev

WORKDIR $APP
