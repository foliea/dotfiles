FROM ghcr.io/homebrew/brew:main

ENV PROJECT_DIR=/home/linuxbrew/dotfiles

WORKDIR ${PROJECT_DIR}

# Copy only the dependency inputs first so the expensive brew install
# layer is cached unless os/shared actually changes.
COPY os/shared ${PROJECT_DIR}/os/shared
RUN ${PROJECT_DIR}/os/shared/dependencies.sh

COPY . ${PROJECT_DIR}
