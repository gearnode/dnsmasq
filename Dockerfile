FROM ubuntu:18.04 AS builder

ARG REMOTE=http://thekelleys.org.uk/git/dnsmasq.git
ARG VERSION

RUN apt-get update && \
  apt-get install -y make git gcc && \
  git clone ${REMOTE} /tmp/dnsmasq && \
  cd /tmp/dnsmasq && \
  git checkout -b ${VERSION} && \
  make install

FROM ubuntu:18.04

LABEL version=${VERSION} \
  maintainer=bryan@frimin.fr

COPY --from=builder /usr/local/sbin/dnsmasq /usr/local/sbin/dnsmasq

EXPOSE 53 53/udp

ENTRYPOINT ["dnsmasq", "-k"]
