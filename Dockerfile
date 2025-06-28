FROM ubuntu:24.04

ENV USER=developer
ENV PROJECT_DIR=/home/${USER}/dotfiles

RUN apt-get update && \
  apt-get install -y build-essential procps curl file git python3 sudo locales && \
  locale-gen en_US.UTF-8

RUN useradd -ms /bin/bash ${USER} && \
  echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
  chsh -s $(which fish) ${USER}

COPY . ${PROJECT_DIR}
RUN chown -R ${USER}:${USER} ${PROJECT_DIR}

USER ${USER}
WORKDIR ${PROJECT_DIR}

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
ENV HOMEBREW_NO_ANALYTICS=1

RUN os/linux/dependencies.sh