# FROM node:alpine
FROM alpine:3.6

# set the default NODE_ENV to production
# for dev/test build with: docker build --build-arg NODE=development .
# and the testing npms will be included
ARG NODE=production
ENV NODE_ENV ${NODE}

# copy package info early to install npms and delete npm command
WORKDIR /usr/src/app
COPY package*.json ./
RUN echo http://mirror.yandex.ru/mirrors/alpine/v3.5/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/v3.5/community >> /etc/apk/repositories

RUN apk update \
 && apk add --no-cache \

RUN apk -U add curl jq bash nodejs nodejs-npm --quiet
RUN npm install && apk del --purge nodejs-npm
RUN m -rvf /var/cache/* /root/.npm /tmp/*

# copy the code
COPY . .
HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -f -s http://localhost:3000/health/ || exit 1
EXPOSE 3000
ENTRYPOINT ["bash","/usr/src/app/startup.sh"]
