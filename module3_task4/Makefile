.PHONY: help build clean post lint package

help: ## Show this help
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'


build: ## Build the awesome-api binary
	go build -o awesome-api


package: build ## Create awesome-website.zip with binary and dist/
	@mkdir -p dist
	zip -r awesome-website.zip awesome-api dist

clean: ## Clean up generated files
	rm -f awesome-api awesome-website.zip

lint: ## Lint Markdown files
	markdownlint README.md DEPLOY.md
