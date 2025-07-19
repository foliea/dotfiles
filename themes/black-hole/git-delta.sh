#!/bin/sh
set -e

config="git config --global"

${config} delta.plus-style "syntax #141414"
${config} delta.minus-style "syntax #141414"
${config} delta.line-numbers-left-style "#e06c75"
${config} delta.line-numbers-right-style "#7fd88f"
${config} delta.line-numbers-minus-style "#e06c75"
${config} delta.line-numbers-plus-style "#7fd88f"
