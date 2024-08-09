FROM node:slim
COPY nginx/MasalFood /www
WORKDIR /www
CMD ["npm", "install", "&&", "npm", "run", "build"]

FROM nginx:latest
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/masalfood.conf /etc/nginx/conf.d/masalfood.conf
COPY --from=0 /www/dist /var/www/masalfood