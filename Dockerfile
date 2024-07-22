# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install necessary packages
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat && \
    rm -rf /var/lib/apt/lists/*

# Make wisecow.sh executable
RUN chmod +x wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Run wisecow.sh when the container launches
CMD ["./wisecow.sh"]
