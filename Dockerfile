FROM node:12.18.3-alpine3.12

WORKDIR '/app'

COPY package*.json ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

FROM nginx

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
