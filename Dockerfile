FROM node:12-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY src ./src
COPY webpack.config.js ./
RUN npm run build

FROM nginx:alpine
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
