#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
export HOSTNAME=nobian

cat << 'EOS'
                __    _
   ____  ____  / /_  (_)___ _____
  / __ \/ __ \/ __ \/ / __ `/ __ \
 / / / / /_/ / /_/ / / /_/ / / / /
/_/ /_/\____/_.___/_/\__,_/_/ /_/

EOS

## Set Hostname
hostnamectl set-hostname ${HOSTNAME}
hostnamectl
sed -i -e "s/debian10jp/${HOSTNAME}/g" /etc/hosts
