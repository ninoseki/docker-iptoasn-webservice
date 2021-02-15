FROM alpine:3.13.1

ENV VERSION 0.2.5

RUN apk add --update --no-cache ca-certificates \
  libressl \
  llvm-libunwind \
  libgcc \
  && apk add --no-cache --virtual .build-rust \
  rust \
  cargo \
  libressl-dev \
  && cargo install iptoasn-webservice --version ${VERSION} \
  && adduser -D app \
  && mv /root/.cargo/bin/iptoasn-webservice /usr/bin/iptoasn-webservice \
  && apk del .build-rust \
  && rm -rf  /root/.cargo \
  /var/cache/apk/* \
  /tmp/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER app

ENTRYPOINT ["/entrypoint.sh"]