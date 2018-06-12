FROM kherrick/alpine-elixir-node:1.0

LABEL version="1.0"

ENV SHARED_DIR=/opt/shared \
  APP_DIR="${SHARED_DIR}/app" \
  ELIXIR_VERSION=v1.6.5 \
  ERLANG_VERSION=20.3.7 \
  HEX_HOME=/opt/hex \
  MIX_HOME=/opt/mix \
  TERM=xterm

WORKDIR "${APP_DIR}"

RUN \
    #
    # install phoenix dependencies and initialize an app ##############
    #
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

CMD ["/bin/bash"]
