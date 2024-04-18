# Usamos una imagen base de Python 3
FROM python:3

# Actualizamos los paquetes del sistema
RUN apt-get update

# Instalamos curl que se usará para instalar Node.js
RUN apt-get install -y curl

# Descargamos e instalamos Node.js v20
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# Verificamos las instalaciones
RUN python3 --version
RUN node --version

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