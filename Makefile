#!/bin/bash -eu

.DEFAULT_GOAL := help
.PHONY: help

debian: ## up --no-provision
	vagrant up --no-provision
	vagrant provision --provision-with core

docker-host: ## provision - docker-host
	vagrant provision --provision-with docker-host

gnome-desktop: ## provision - gnome-desktop
	vagrant provision --provision-with gnome-desktop

common: ## provision - common-tools,common-utils
	vagrant provision --provision-with common-tools,common-utils

web-server: ## provision - server-utils
	vagrant provision --provision-with server-utils

allenv: ## provision - **env (require: common-utils)
	vagrant provision --provision-with allenv

development: ## provision - development-tools,development-utils (require: common-utils)
	vagrant provision --provision-with development-tools,development-utils

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
