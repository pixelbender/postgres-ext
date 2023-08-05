FROM postgres:latest as build

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y postgresql-server-dev-15
RUN apt-get install -y checkinstall
RUN apt-get install -y git
RUN apt-get install -y wget

ARG PG_IVM_VERSION
WORKDIR /build/pg-ivm
RUN wget -cq https://github.com/sraoss/pg_ivm/archive/refs/tags/v${PG_IVM_VERSION}.tar.gz -O - | tar -xz --strip-components 1
RUN checkinstall --install=no --fstrans=no --pkgname=pg-ivm --pkgversion=${PG_IVM_VERSION} -y
RUN mv pg-ivm*.deb ../pg-ivm-${PG_IVM_VERSION}.deb
RUN ls -la

FROM postgres:latest
COPY --from=build /build/*.deb /tmp
RUN apt install -y /tmp/*.deb
