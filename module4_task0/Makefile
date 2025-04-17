.PHONY: help build clean post lint package check-tools

TOOLS = docker hugo

help: ## Show this help
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

check-tools: ## Check required tools are installed
	@for tool in $(TOOLS); do \
	command -v $$tool > /dev/null 2>&1 || { echo >&2 "$$tool is not installed. Aborting."; exit 1; };\
	done
build: check-tools build-go build-hugo

build-go: ## Build the awesome-api binary using Docker
	docker run --rm -v $(PWD):/go/src/app -w /go/src/app golang:1.15.8-buster go build -o awesome-api

build-hugo: ## Build the static site with hugo
	hugo -d dist


package: build ## Create awesome-website.zip with binary and dist/
	@mkdir -p dist
	zip -r awesome-website.zip awesome-api dist

clean: ## Clean up generated files
	rm -f awesome-api awesome-website.zip

lint: ## Lint Markdown files
	markdownlint README.md DEPLOY.md
