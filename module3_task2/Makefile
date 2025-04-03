.PHONY: help build clean post

help: ## This is the help command
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

# Build the binary
build:
	go build -o awesome-api

# Create the package
package: build
	zip -r awesome-website.zip awesome-api dist

# Clean up generated files
clean:
	rm -f awesome-api awesome-website.zip

# Lint Markdown files
lint:
	markdownlint README.md DEPLOY.md
