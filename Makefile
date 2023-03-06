.PHONY: help
.DEFAULT_GOAL := help

SERVER_USER=""
SERVER_HOSTNAME=""

ifneq (,$(wildcard .secrets/.env))
include .secrets/.env
    export
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

fetch-latest-lodex: ## Fetch the latest version of lodex
	@echo "Fetching the latest version of lodex"
	curl -L https://api.github.com/repos/INIST-CNRS/lodex/tarball > lodex.tar.gz && \
	tar -xzf lodex.tar.gz && \
	mv ./Inist-CNRS-lodex-* lodex && \
	rm lodex.tar.gz
	@echo "The latest version of Lodex is now in the lodex folder"

custom-config: ## Copy a custom config file and docker-compose to lodex
	@echo "Copying a custom config file to lodex"
	cp ./config.json lodex/config.json
	@echo "The custom config file is now in lodex/config.js"
	@echo "Copying a custom docker-compose to lodex"
	cp ./docker-compose.yml lodex/docker-compose.yml
	@echo "The custom docker-compose is now in lodex/docker-compose.yml"

install-lodex: ## Install lodex
	@echo "Installing lodex"
	@(${MAKE} -C lodex install)
	@echo "Lodex is now installed"

start-lodex: ## Start lodex
	@echo "Starting lodex"
	@(${MAKE} -C lodex run-dev)
	@echo "Lodex is now started"

start-prod: ## Start lodex in production mode
	@echo "Starting lodex in production mode"
	@(${MAKE} -C lodex run)
	@echo "Lodex is now started in production mode"

production-ssh-test: ## Test SSH connection to production server
	ssh -T \
        -o StrictHostKeyChecking=no \
		-i .secrets/hcl.pem \
		${SERVER_USER}@${SERVER_HOSTNAME} \
		exit

production-deploy: ## Deploy HCL lodex to AWS
	scp \
        -o StrictHostKeyChecking=no \
		-i .secrets/hcl.pem \
		docker-compose.yml config.json Makefile run-production.sh \
		${SERVER_USER}@${SERVER_HOSTNAME}:~

	ssh \
        -o StrictHostKeyChecking=no \
	 	-i .secrets/hcl.pem \
	 	${SERVER_USER}@${SERVER_HOSTNAME} \
	 	'./run-production.sh'