### STAGE 1: Build ###
FROM node:12.7-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
EXPOSE 80
COPY --from=0 /usr/src/app/dist /usr/share/nginx/html