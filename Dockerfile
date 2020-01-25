# FROM node:alpine
FROM alpine:3.6

RUN \
    # DNS problem workaround
    # https://github.com/gliderlabs/docker-alpine/issues/386
    printf "nameserver 8.8.8.8\nnameserver 9.9.9.9\nnameserver 1.1.1.1" > /etc/resolve.conf \
    \
    && apk add --no-cache bash
# set the default NODE_ENV to production
# for dev/test build with: docker build --build-arg NODE=development .
# and the testing npms will be included
ARG NODE=production
ENV NODE_ENV ${NODE}

# copy package info early to install npms and delete npm command
WORKDIR /usr/src/app
COPY package*.json ./

RUN ping alpine.mirror.far.fi
RUN apk -U add curl jq bash nodejs nodejs-npm && \
  npm install && apk del --purge nodejs-npm && \
  rm -rvf /var/cache/* /root/.npm /tmp/*

# copy the code
COPY . .
HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -f -s http://localhost:3000/health/ || exit 1
EXPOSE 3000
ENTRYPOINT ["bash","/usr/src/app/startup.sh"]
