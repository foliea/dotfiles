#!/bin/sh
set -e

config="git config --global"

${config} delta.syntax-theme "base16"
${config} delta.plus-style "syntax #31414a"
${config} delta.minus-style "syntax #43353c"
${config} delta.line-numbers-zero-style "#6a6a6a"
${config} delta.line-numbers-left-style "#db5169"
${config} delta.line-numbers-right-style "#65ecc9"
${config} delta.line-numbers-minus-style "#db5169"
${config} delta.line-numbers-plus-style "#65ecc9"
${config} delta.minus-emph-style "#212121 #db5169"
${config} delta.plus-emph-style "#212121 #65ecc9"
