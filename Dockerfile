FROM node:12

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install and cache app dependencies
COPY package.json ./package.json
RUN npm install --loglevel=error
RUN npm install -g @angular/cli --loglevel=error
RUN ng config -g cli.warnings.versionMismatch false

RUN npm i -g @angular/cli --loglevel=error

COPY . .

RUN ng config -g cli.packageManager yarn
