FROM node:20.10.0

# Set the working directory
WORKDIR /usr/src/app

# Copy the necessary files
COPY package*.json ./

# Install dependencies
RUN npm install

# Install the medusa-cli
RUN npm install @medusajs/medusa-cli -g

# Add the remaining files
COPY . .

# Set the default command to run when the container starts
ENTRYPOINT ["npm", "run", "start"]