#!/bin/sh
set -e

config="git config --global"

${config} delta.syntax-theme "base16"
${config} delta.plus-style "syntax #1b2b34"
${config} delta.minus-style "syntax #2d1f26"
${config} delta.line-numbers-zero-style "#808080"
${config} delta.line-numbers-left-style "#c53b53"
${config} delta.line-numbers-right-style "#4fd6b3"
${config} delta.line-numbers-minus-style "#c53b53"
${config} delta.line-numbers-plus-style "#4fd6b3"
${config} delta.minus-emph-style "#000000 #c53b53"
${config} delta.plus-emph-style "#000000 #4fd6b3"
