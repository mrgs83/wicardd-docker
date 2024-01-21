# Use Ubuntu 20.04 as a base image
FROM ubuntu:20.04

# Set maintainer information
LABEL maintainer="info@example.com"

# Avoid interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    nano \
    curl \
    net-tools \
    libssl-dev \
    libdvbcsa-dev \
    && rm -rf /var/lib/apt/lists/* # Clean up

# Create a config directory
RUN mkdir /config

# Copy the wicardd binaries to /usr/local/bin and config to /config
COPY wicardd-x64.* /usr/local/bin/
COPY wicardd.conf /config/
COPY start.sh /usr/local/bin/

# Set permissions for the binaries and script
RUN chmod +x /usr/local/bin/wicardd-x64.* /usr/local/bin/start.sh

# Expose the ports used by wicardd
EXPOSE 8888 9000 50000

# Use the start.sh script to run the application
CMD ["/usr/local/bin/start.sh"]
