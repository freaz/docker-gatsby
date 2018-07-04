FROM node:10-alpine

COPY ./entry.sh /
COPY gatsby.conf /etc/nginx/conf.d/default.conf

RUN apk add --no-cache \
      nginx \
      python \
      build-base \
    && npm install --global --no-optional gatsby@1.9 \
    && mkdir -p /www /run/nginx \
    && chmod +x /entry.sh \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /www
EXPOSE 80

ONBUILD COPY . /www
ONBUILD RUN npm install
ONBUILD RUN gatsby build

ENTRYPOINT [ "/entry.sh" ]
CMD [ "serve-nginx" ]
