#!/bin/bash -eu

.DEFAULT_GOAL := help
.PHONY: help

debian: ## up --no-provision
	@vagrant up --no-provision
	@vagrant provision --provision-with core

docker-host: ## provision - docker-host
	@vagrant provision --provision-with docker-host

gnome-desktop: ## provision - gnome-desktop
	@vagrant provision --provision-with gnome-desktop

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
