# Use a specific Ubuntu version as a base for consistency
FROM ubuntu:20.04

# Set the maintainer label
LABEL maintainer="info@mrgs.link"

# Set environment variables to prevent prompts and define version
ENV DEBIAN_FRONTEND=noninteractive \
    SATIP_SERVER_VERSION=1.3.1

    
# Update and install necessary tools
RUN apt-get update && apt-get install -y \
    git \
    libtool \
    htop \
    nano \
    curl \
    net-tools \
    libssl-dev \
    libdvbcsa-dev \
    && rm -rf /var/lib/apt/lists/* # Clean up apt cache to reduce image size

# Copy wicardd binary and config
COPY wicardd.conf /usr/bin/tuxbox/

# Set the working directory to /satip_streamer
WORKDIR /usr/bin/
COPY wicardd-* /usr/bin/
COPY start.sh /usr/bin/
RUN chmod +x /usr/bin/wicardd-* && chmod +x /usr/bin/start.sh

# Expose necessary ports
EXPOSE 8888 9000 50000

# Set the CMD for the container to use the start.sh script
CMD ["./start.sh"]
