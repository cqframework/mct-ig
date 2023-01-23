FROM --platform=linux/amd64 nginx:1.23.3-alpine

COPY /output /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
