.PHONY: help build clean post

help: ## This is the help command
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'


build: ## Generate the hugo website
	@echo "Generating the Hugo website..."
	hugo

clean: ## Cleanup the public directory
	@echo "Cleaning the content of the public directory..."
	rm -rf public/

post: ## Create a new blog post with POST_NAME as filename and title
	@echo "Creating a new blog post: $(POST_NAME)"
	hugo new content content/posts/$(POST_NAME).md
