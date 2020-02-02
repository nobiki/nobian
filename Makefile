#!/bin/bash -eu

.DEFAULT_GOAL := help
.PHONY: help

debian: ## up --no-provision (require for all tasks)
	vagrant up --no-provision
	vagrant provision --provision-with core

docker-host: ## provision - docker-host
	vagrant provision --provision-with docker-host
	vagrant reload

gnome-desktop: ## provision - gnome-desktop
	vagrant provision --provision-with gnome-desktop
	vagrant reload
	vagrant snapshot save gnome-desktop

common: ## provision - common-tools,common-utils
	vagrant provision --provision-with common-tools,common-utils

web-server: ## provision - server-utils
	vagrant provision --provision-with server-utils

development: ## provision - development-tools,development-utils (require: common-utils)
	vagrant provision --provision-with development-tools,development-utils

task-full: ## task - all tasks (dry-run: `make -n`)
	make docker-host
	make common
	make web-server
	make development

task-full-desktop: ## task - all tasks with gnome-desktop (dry-run: `make -n`)
	make gnome-desktop
	make docker-host
	make common
	make web-server
	make development
	vagrant snapshot save task-full-desktop

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
