FROM postgres:14.2

LABEL maintainer="Danilo Souza <danilo.souza1@gmail.com>"

RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.utf8

RUN apt-get update -y && \
  apt-get install -y --no-install-recommends curl \
  nano \
  git  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*