FROM node

RUN apt-get update && apt-get install -yq make
RUN npm install -g npm@9.7.2

WORKDIR /app

COPY app/package.json .
COPY app/package-lock.json .

RUN npm ci

COPY ./app .

EXPOSE 8080

CMD ["bash", "-c", "npm run migrate && npx fastify start -a 0.0.0.0 -l info -P app.js"]
