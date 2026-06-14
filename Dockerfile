FROM node:lts AS build
ADD . /app
WORKDIR /app
RUN npm install
RUN npm run build

FROM nginx:latest
RUN rm -rf /usr/share/nginx/html
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80


