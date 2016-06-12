FROM alpine:3.7

LABEL version="1.0"

ENV SHARED_DIR=/opt/shared \
  BUILD_DIR=/tmp/environment-build \
  ELIXIR_VERSION=v1.6.5 \
  ERLANG_VERSION=20.3.7 \
  HEX_HOME=/opt/hex \
  MIX_HOME=/opt/mix \
  PATH=./node_modules/.bin:"${PATH}" \
  TERM=xterm

WORKDIR "${BUILD_DIR}"

RUN \
    #
    # system setup ###############################
    #
    addgroup -g 1000 user \
      && adduser -u 1000 -G user -s /bin/sh -D user \
      && \
    # add repos
    printf '@main http://dl-cdn.alpinelinux.org/alpine/v3.7/main\n' >> /etc/apk/repositories \
      && printf '@community http://dl-cdn.alpinelinux.org/alpine/v3.7/community\n' >> /etc/apk/repositories \
      && printf '@edge http://nl.alpinelinux.org/alpine/edge/main\n' >> /etc/apk/repositories \
      && \
    # upgrade system
    apk --no-cache --update upgrade \
      && \
    # build dependencies
    apk add --no-cache --virtual .virtual-build-dependencies \
      autoconf@main \
      build-base@main \
      dpkg-dev@main \
      dpkg@main \
      ncurses-dev@main \
      openssl-dev@main \
      perl-dev@main \
      unixodbc-dev@main \
      zlib-dev@main \
      && \
    # development dependencies
    apk add --no-cache --virtual .virtual-development \
      bash \
      curl \
      git \
      inotify-tools \
      wget \
      && \
    # OpenSSL
    apk add --no-cache \
      ca-certificates@main \
      # update-ca-certificates
      # https://github.com/gliderlabs/docker-alpine/issues/30
      # https://github.com/gliderlabs/docker-alpine/issues/52
      # https://github.com/gliderlabs/docker-alpine/issues/315
      && update-ca-certificates 2>/dev/null || true \
      && \
    #
    # erlang setup ###############################
    #
    apk add --no-cache \
      pcre@edge \
      && \
    # get source
    git clone -b OTP-"${ERLANG_VERSION}" --single-branch --depth 1 https://github.com/erlang/otp.git . \
      && \
    # setup build environment
    export ERL_OTP="${BUILD_DIR}" \
      && export PATH="${ERL_OTP}"/bin:"${PATH}" \
      && export CPPFlAGS="-D_BSD_SOURCE $CPPFLAGS" \
      && \
    # configure / make / make install
    ./otp_build autoconf \
      && ./configure --prefix=/usr \
        --build="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --without-javac \
        --without-wx \
        --without-debugger \
        --without-observer \
        --without-jinterface \
        --without-cosEvent\
        --without-cosEventDomain \
        --without-cosFileTransfer \
        --without-cosNotification \
        --without-cosProperty \
        --without-cosTime \
        --without-cosTransactions \
        --without-et \
        --without-gs \
        --without-ic \
        --without-megaco \
        --without-orber \
        --without-percept \
        --without-typer \
        --enable-threads \
        --enable-shared-zlib \
        --enable-ssl=dynamic-ssl-lib \
        --enable-hipe \
      && \
    make -j4 && make install \
      && \
    #
    # elixir setup ###############################
    #
    git clone https://github.com/elixir-lang/elixir --depth 1 --branch "${ELIXIR_VERSION}" \
      && cd elixir \
      && make && make install \
      && \
    # hex+rebar setup
    mix local.hex --force \
      && mix local.rebar --force \
      && \
    #
    # nodejs setup ###############################
    #
    apk add --no-cache nodejs \
      && \
    #
    # cleanup ####################################
    #
    apk del --force .virtual-build-dependencies \
      && rm -rf "${BUILD_DIR}" \
      && rm -rf /var/cache/apk/*

WORKDIR "${SHARED_DIR}"

CMD ["/bin/bash"]
