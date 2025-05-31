FROM ubuntu:24.04

ENV USER=developer
ENV PROJECT_DIR=/home/${USER}/dotfiles

COPY os/ubuntu/dependencies.sh /tmp/dependencies.sh
RUN /tmp/dependencies.sh

RUN useradd -ms /bin/bash ${USER} && \
  echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
  chsh -s $(which fish) ${USER}

COPY . ${PROJECT_DIR}
RUN chown -R ${USER}:${USER} ${PROJECT_DIR}

USER ${USER}
WORKDIR ${PROJECT_DIR}
