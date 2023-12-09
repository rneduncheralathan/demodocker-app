FROM node:16.20.2 as build

WORKDIR /demodocker-app

COPY . .

RUN npm install

RUN npm run build 

RUN npm install tar@latest

FROM nginx:1.18.0

COPY --from=build /demodocker-app/dist/demodocker-app /usr/share/nginx/html

EXPOSE 83
