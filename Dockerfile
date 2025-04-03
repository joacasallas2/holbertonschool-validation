# Use an official Ubuntu image
FROM ubuntu:22.04

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory inside the container
WORKDIR /app

# Copy the project files (Makefile and setup script)
COPY . .

# Make setup script executable
RUN chmod +x module3_task1/setup.sh

# Update system and install dependencies
RUN apt-get update && apt-get install -y make wget

# Run the setup script
RUN module3_task1/setup.sh

# Set the default command to keep the container running (or override in docker run)
CMD ["tail", "-f", "/dev/null"]
