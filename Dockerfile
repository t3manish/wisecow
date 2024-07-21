# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install any needed packages specified in package.json
RUN npm install

# Copy the rest of the application code
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the app when the container launches
CMD ["npm", "start"]
