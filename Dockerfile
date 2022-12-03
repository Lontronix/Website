FROM docker.io/node:19 as builder

WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . /app/
RUN npm run build

FROM docker.io/galenguyer/nginx:alpine3.16.2-spa as runtime

COPY --from=builder /app/dist /usr/share/nginx/html
