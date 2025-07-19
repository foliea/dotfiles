#!/bin/sh
set -e

config="git config --global"

${config} delta.plus-style "syntax #393939"
${config} delta.minus-style "syntax #393939"
${config} delta.line-numbers-left-style "#f2777a"
${config} delta.line-numbers-right-style "#99cc99"
${config} delta.line-numbers-minus-style "#f2777a"
${config} delta.line-numbers-plus-style "#99cc99"
