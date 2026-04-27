FROM ubuntu:26.04

ENV USER=developer
ENV PROJECT_DIR=/home/${USER}/dotfiles

COPY os/ubuntu/dependencies.sh /tmp/dependencies.sh
RUN chmod +x /tmp/dependencies.sh && \
  /tmp/dependencies.sh system

RUN useradd -ms /bin/bash ${USER} && \
  echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
  chsh -s "$(which bash)" ${USER}

COPY . ${PROJECT_DIR}
RUN chown -R ${USER}:${USER} ${PROJECT_DIR}

USER ${USER}
WORKDIR ${PROJECT_DIR}

RUN /tmp/dependencies.sh homebrew

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

RUN bash -c "ulimit -n 65536 && /tmp/dependencies.sh packages"
