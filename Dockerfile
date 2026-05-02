FROM ghcr.io/ublue-os/bluefin-dx:stable

ENV USER=developer
ENV PROJECT_DIR=/home/${USER}/dotfiles

RUN useradd -ms /bin/bash ${USER} && \
  echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN tar --zstd -xf /usr/share/homebrew.tar.zst -C / && \
  chown -R ${USER}:${USER} /home/linuxbrew

COPY . ${PROJECT_DIR}
RUN chown -R ${USER}:${USER} ${PROJECT_DIR}

USER ${USER}
WORKDIR ${PROJECT_DIR}

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

RUN ./os/bazzite/dependencies.sh
