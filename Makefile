.PHONY: help
.DEFAULT_GOAL := help


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

fetch-lastest-lodex: ## Fetch the latest version of lodex
	@echo "Fetching the latest version of lodex"
	curl -L https://api.github.com/repos/INIST-CNRS/lodex/tarball > lodex.tar.gz && \
	tar -xzf lodex.tar.gz && \
	mv ./Inist-CNRS-lodex-* lodex && \
	rm lodex.tar.gz
	@echo "The lastest version of Lodex is now in the lodex folder"


install-lodex: ## Install lodex
	@echo "Installing lodex"
	@(${MAKE} -C lodex install)
	@echo "Lodex is now installed"

start-lodex: ## Start lodex
	@echo "Starting lodex"
	@(${MAKE} -C lodex run-dev)
	@echo "Lodex is now started"
