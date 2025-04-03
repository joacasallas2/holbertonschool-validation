.PHONY: backup clean deploy

build: # Generate the website from the markdown and configuration files in the directory public/.
	echo "Generate the website from the markdown and configuration files in the directory public/."
	hugo

clean: # Cleanup the content of the directory public/
	echo "Cleanup the content of the directory public/"
	rm -rf public/

post: # Create a new blog post which filename and title come from the environment variable POST_NAME.
	echo "Create a new blog post which filename and title come from the environment variable POST_NAME."
	hugo new content content/posts/$(POST_NAME).md
