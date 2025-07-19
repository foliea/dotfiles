#!/bin/sh
set -e

config="git config --global"

${config} delta.plus-style "syntax #252525"
${config} delta.minus-style "syntax #252525"
${config} delta.line-numbers-zero-style "#6a6a6a"
${config} delta.line-numbers-left-style "#e06c75"
${config} delta.line-numbers-right-style "#7fd88f"
${config} delta.line-numbers-minus-style "#e06c75"
${config} delta.line-numbers-plus-style "#7fd88f"
${config} delta.minus-emph-style "normal #e06c75"
${config} delta.plus-emph-style "normal #7fd88f"
