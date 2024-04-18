# Set the base image to Ubuntu
FROM ubuntu:latest

# Set the working directory
WORKDIR /usr/src/app

# Install Python and Node.js
RUN apt-get update && apt-get install -y python3 nodejs npm

# Copy the necessary files
COPY package*.json ./

RUN npm install -g npm@latest

# Install dependencies
RUN npm install --force

# Install the medusa-cli
RUN npm install @medusajs/medusa-cli -g

# Add the remaining files
COPY . .

# Set the default command to run when the container starts
ENTRYPOINT ["npm", "run", "start"]