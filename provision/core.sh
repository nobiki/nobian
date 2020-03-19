#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

core provision.sh
core shell/root-core.sh
core shell/fzf.sh
