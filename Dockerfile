FROM node:12-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
# TODO: webpack build
COPY src ./build

FROM nginx:alpine
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html