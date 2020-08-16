FROM node:12.16.1-alpine as builder

WORKDIR '/app'


COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/dist/frontend /usr/share/nginx/html
