#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
export HOSTNAME=nobian

## Set Hostname
hostnamectl set-hostname ${HOSTNAME}
hostnamectl

