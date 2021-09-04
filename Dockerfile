FROM node:12.16.3
WORKDIR /code
ENV PORT 80
COPY package.json /code/package.json
RUN npn install
COPY . /code
CMD [ "node", "src/server.js" ]
