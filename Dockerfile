FROM z3r05um/debian:11.3-slim-mit-scheme-builder AS builder
ARG VERSION="11.2"
ARG ARCH # aarch64le or x86-64
ARG MIRROR="https://ftp.gnu.org/gnu"
RUN curl -sSLO ${MIRROR}/mit-scheme/stable.pkg/${VERSION}/mit-scheme-${VERSION}-${ARCH}.tar.gz \
 && tar xzf mit-scheme-${VERSION}-${ARCH}.tar.gz \
 && cd mit-scheme-${VERSION}/src \
 && ./configure --prefix=/opt/mit-scheme \
 && make \
 && make install

FROM debian:11.3-slim
COPY --from=builder /opt/mit-scheme /opt/mit-scheme
CMD ["/opt/mit-scheme/bin/mit-scheme"]
