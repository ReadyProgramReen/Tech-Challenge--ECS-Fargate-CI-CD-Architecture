# Use Node 16 (matches the version tested locally)
FROM node:16-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package files first (leverages Docker layer caching)
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy the rest of the backend source code
COPY . .

# Expose the port the backend listens on
EXPOSE 8080

# Start the app
CMD ["node", "index.js"]