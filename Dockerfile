# Use an official Node image as the parent image
FROM node:20.12.0-alpine

# Set the working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the project files
COPY . .

# Build the application for production
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]