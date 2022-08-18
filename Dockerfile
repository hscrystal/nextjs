FROM node:alpine

RUN mkdir -p /app
WORKDIR /app

COPY package*.json /app/
RUN npm install

COPY . /app

RUN npm run build
RUN chown -R node:node /app/.next
USER node
EXPOSE 3000

CMD ["npm", "run","dev"]
