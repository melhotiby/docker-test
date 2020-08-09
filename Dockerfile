### STAGE 1: Build ###
FROM node:12.7-alpine
WORKDIR /app
COPY package*.json ./
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn build

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html