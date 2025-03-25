#Lifecycle Hugo website 
 
help:           ## help options
	@echo " Available help commands:"
	@echo "	make build		- Generate website"
	@echo " make clean		- Cleanup the public directory"
	@echo " make post		- Create a new blog post '(use POST_NAME=<name>)"
	@echo " make help		- Show this help message"
 
 
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
