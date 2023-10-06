#!/bin/bash

[[ -f "$HOME/.shrc" ]] && . "$HOME/.shrc"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

set -o vi
shopt -s autocd
