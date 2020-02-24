FROM node:alpine
LABEL maintainer "Christopher Snyder" <34378288+maliciousactor@users.noreply.github.com>

# install build dependencies
RUN set -eux; \
    apk add --no-cache --virtual .build-dependencies \
        build-base \
        python

# copy openkb source
COPY locales/ /var/openKB/locales/
COPY public/ /var/openKB/public/
COPY routes/ /var/openKB/routes/
COPY views/ /var/openKB/views/
COPY config/ /var/openKB/config/
COPY app.js /var/openKB/
COPY package.json /var/openKB/

# install openkb
WORKDIR /var/openKB
RUN npm install

# clean image
RUN apk del --no-network .build-dependencies

# set data volume
VOLUME /var/openKB/data

# openkb available on port 4444
EXPOSE 4444

ENTRYPOINT ["npm", "start"]
