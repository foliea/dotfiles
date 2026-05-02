FROM ghcr.io/ublue-os/bluefin-dx:stable

ENV USER=developer \
    PROJECT_DIR=/home/developer/dotfiles \
    PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

RUN useradd -ms /bin/bash ${USER} && \
  tar --zstd -xf /usr/share/homebrew.tar.zst -C / && \
  chown -R ${USER}:${USER} /home/linuxbrew

USER ${USER}
WORKDIR ${PROJECT_DIR}

# Copy only the dependency inputs first so the expensive brew install
# layer is cached unless os/bazzite or os/shared actually change.
COPY --chown=${USER}:${USER} os/shared ${PROJECT_DIR}/os/shared
COPY --chown=${USER}:${USER} os/bazzite ${PROJECT_DIR}/os/bazzite
RUN ${PROJECT_DIR}/os/bazzite/dependencies.sh

COPY --chown=${USER}:${USER} . ${PROJECT_DIR}
