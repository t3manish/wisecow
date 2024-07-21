FROM node:14

# Install fortune and cowsay
RUN apt-get update && apt-get install -y fortune cowsay

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Make wisecow.sh executable
RUN chmod +x wisecow.sh

# Expose the port
EXPOSE 4499

# Command to run the app
CMD ["./wisecow.sh"]
