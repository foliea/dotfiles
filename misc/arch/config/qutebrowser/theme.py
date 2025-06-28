import os

home = os.environ["HOME"]

filename = f"{home}/.Xresources.d/theme"

with open(filename) as f:
    theme = f.read().splitlines()

colors = {}

for entry in theme:
    _, key, value = entry.split(' ')
    colors[key] = value
