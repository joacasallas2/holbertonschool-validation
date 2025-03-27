#Lifecycle Hugo website 
 
help:           ## show make options
	@echo " Available help commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'
 
 
build:       ## Generate the website and configuration files in the directory public/.
	@echo "Generating the Hugo website..."
	hugo
 
clean:       ## Cleanup the content of the directory public/
	@echo "Cleaning the content of the public directory..."
	rm -rf public
 
post:       ## Create a new blog post which filename and title come from the environment variable POST_NAME.
	@echo "Create a new blog post which filename and title come from the environment variable POST_NAME."
	hugo new posts/$(POST_NAME).md
	sed -i "s/title:.*/title: \"$(POST_NAME)\"/" content/posts/$(POST_NAME).md
