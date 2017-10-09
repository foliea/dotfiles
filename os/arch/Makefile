.PHONY: all re clean dependencies packages config dpi display autologin binaries services boot

all: dependencies packages config dpi display autologin binaries services boot

clean:
	scripts/clean.sh

link: clean
	scripts/link.sh

dependencies:
	scripts/dependencies.sh

packages:
	scripts/system-packages.sh

config: link
	scripts/install.sh config

dpi:
	scripts/install.sh dpi

display:
	scripts/install.sh display

autologin:
	scripts/install.sh autologin

binaries:
	scripts/install.sh binaries

boot:
	scripts/install.sh boot

services:
	scripts/install.sh services
