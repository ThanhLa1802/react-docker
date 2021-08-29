#create from nodejs 14
FROM node:14-stretch-slim as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build
#copy build into nginx
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html