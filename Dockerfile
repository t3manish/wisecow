# Use an official Node runtime as a parent image
FROM node:14

# Install cowsay, fortune-mod, and netcat-openbsd
RUN apt-get update && \
    apt-get install -y fortune cowsay netcat-openbsd

# Add the installation path to PATH
ENV PATH="/usr/games:${PATH}"

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Ensure the script is executable
RUN chmod +x ./wisecow.sh

# Expose the port
EXPOSE 8080

# Start the application
CMD ["./wisecow.sh"]
