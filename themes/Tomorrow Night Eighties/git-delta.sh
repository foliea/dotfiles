#!/bin/sh
set -e

config="git config --global"

${config} delta.syntax-theme "base16"
${config} delta.plus-style "syntax #34444d"
${config} delta.minus-style "syntax #46383f"
${config} delta.line-numbers-zero-style "#999999"
${config} delta.line-numbers-left-style "#de546c"
${config} delta.line-numbers-right-style "#68efcc"
${config} delta.line-numbers-minus-style "#de546c"
${config} delta.line-numbers-plus-style "#68efcc"
${config} delta.minus-emph-style "#2d2d2d #de546c"
${config} delta.plus-emph-style "#2d2d2d #68efcc"
