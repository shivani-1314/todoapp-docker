FROM node:18-alpine 
WORKDIR /app
COPY pacakge*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:latest
COPY --from=installer /app/build /usr/share/nginx/html

