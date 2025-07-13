FROM ubuntu:24.04

ENV USER=developer
ENV PROJECT_DIR=/home/${USER}/dotfiles

COPY os/linux/ubuntu.sh /tmp/ubuntu.sh
RUN chmod +x /tmp/ubuntu.sh && \
    /tmp/ubuntu.sh install_ubuntu_deps

RUN useradd -ms /bin/bash ${USER} && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chsh -s $(which fish) ${USER}

COPY . ${PROJECT_DIR}
RUN chown -R ${USER}:${USER} ${PROJECT_DIR}

USER ${USER}
WORKDIR ${PROJECT_DIR}

RUN /tmp/ubuntu.sh install_homebrew

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

RUN ulimit -n 65536 && os/linux/dependencies.sh
