# Set the base image to Node 17.1.0-alpine
FROM node

# Set the working directory
WORKDIR /usr/src/app

# Install Python3
RUN apt-get update && apt-get install -y python3

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