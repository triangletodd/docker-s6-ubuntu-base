################################################################################
FROM ubuntu:latest AS base
LABEL maintainer="Todd Edwards <todd@mtn.cc>"
LABEL github="https://github.com/triangletodd/docker-s6-ubuntu-base"
LABEL dockerhub="https://hub.docker.com/r/todd/s6-ubuntu-base/"

COPY bin/install_reqs /usr/local/sbin/
RUN bash -c install_reqs

COPY bin/install_s6 /usr/local/sbin/
RUN bash -c install_s6

################################################################################
FROM ubuntu:latest
LABEL maintainer="Todd Edwards <todd@mtn.cc>"
LABEL github="https://github.com/triangletodd/docker-s6-ubuntu-base"
LABEL dockerhub="https://hub.docker.com/r/todd/s6-ubuntu-base/"

COPY --from=base /tmp/s6 /

ENTRYPOINT ["/init"]
