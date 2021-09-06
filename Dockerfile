FROM node:14
WORKDIR /usr/src/app
COPY package*.json app.js ./
RUN npm install
RUN npm install mocha chai
RUN npm install request
EXPOSE 3000
CMD ["node", "app.js"]
