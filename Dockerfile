FROM node:lts-alpine AS BUILD_STAGE

WORKDIR /ui

COPY package*.json ./

RUN npm install

COPY src/ ./src/
COPY public/ ./public/

RUN npm run build

FROM httpd:alpine

COPY --from=BUILD_STAGE /ui/build/ /usr/local/apache2/htdocs/

