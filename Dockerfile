FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#irgend ein problem mit aws
#COPY --from=0 /app/build /usr/share/nginx/html