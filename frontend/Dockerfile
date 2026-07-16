# ---- Stage 1: Build the React app ----
FROM node:16-alpine AS build

WORKDIR /usr/src/app

# Copy package files first for layer caching
COPY package*.json ./
RUN npm ci

# Copy rest of the frontend source and build it
COPY . .
RUN npm run build

# ---- Stage 2: Serve the build with nginx ----
FROM nginx:stable-alpine

# Copy built static files from Stage 1 into nginx's default serving directory
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose port 80 (nginx default)
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]