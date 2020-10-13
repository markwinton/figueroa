FROM node:12-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY .babelrc webpack.config.js ./
COPY src ./src
RUN npm run build
COPY index.html ./build

FROM nginx:alpine
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
