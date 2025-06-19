dev: .cache/ipn-dns ## Run a local dev server
	@.cache/ipn-dns -p 6000
.PHONY: dev

deploy: ## Deploy site to Fly.io
	flyctl deploy --remote-only
.PHONY: deploy

.cache/ipn-dns: go.sum $(shell find -name "*.go")
	@go build -o ./.cache/ipn-dns .


help:
	@echo ""
	@echo "Available commands:"
	@echo ""
	@grep -hE '^[0-9a-zA-Z_-]+:.*?## .*$$' ${MAKEFILE_LIST} | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-12s\033[m %s\n", $$1, $$2}'
.PHONY: help

.DEFAULT_GOAL := help
