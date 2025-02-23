# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the locale to GMT+1 compatible (e.g., en_US.UTF-8 or fr_FR.UTF-8)
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Define the username as a build argument
ARG USERNAME

# Update the package list and install necessary packages
RUN apt update && \
    apt install -y \
    sudo \
    locales \
    tzdata \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Generate the desired locale (en_US.UTF-8)
RUN locale-gen en_US.UTF-8

# Set the timezone to GMT+1 (e.g., Europe/Paris)
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Check if the user already exists before creating it
RUN if id "${USERNAME}" >/dev/null 2>&1; then \
        echo "User ${USERNAME} already exists, skipping creation."; \
    else \
        useradd -m -s /bin/bash ${USERNAME} && \
        usermod -aG sudo ${USERNAME}; \
    fi

    
# Set a password for the user (optional)
RUN echo "${USERNAME}:test1234" | chpasswd

RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user
USER ${USERNAME}

# Set the working directory to the home directory of the user
WORKDIR /home/${USERNAME}

# Default command to run when the container starts
CMD ["/bin/bash"]
