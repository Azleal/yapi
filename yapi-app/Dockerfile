FROM node:9.2-alpine as builder
ARG YAPI_APP_VERSION=1.7.0

RUN apk add --no-cache git python make openssl tar gcc
RUN echo "YAPI_APP_VERSION is ${YAPI_APP_VERSION}"
ADD http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-${YAPI_APP_VERSION}.tgz /home/
RUN cd /home/ && tar xzvf yapi-vendor-${YAPI_APP_VERSION}.tgz && \
    	mkdir /api && mv /home/package /api/vendors && \
        cd /api/vendors && \
        npm install --production 
FROM node:9.2-alpine
MAINTAINER Azleal

ENV TZ="Asia/Shanghai" HOME="/"
RUN alias ll='ls -alh'

WORKDIR ${HOME}
COPY --from=builder /api/vendors /api/vendors
COPY config.json /api/
EXPOSE 3000
ENTRYPOINT ["node"]

