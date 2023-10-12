ARG BUILD_DIR=/build

FROM mikrosk/m68k-atari-mint-base:master as base
RUN apt -y update
RUN apt -y install bison flex gcc

WORKDIR /src
COPY build.sh .

# renew the arguments
ARG BUILD_DIR

ENV MINTLIB_BRANCH	    dlmalloc
ENV MINTLIB_URL		    https://github.com/mikrosk/mintlib/archive/refs/heads/${MINTLIB_BRANCH}.tar.gz
ENV MINTLIB_FOLDER      mintlib-${MINTLIB_BRANCH}
RUN wget -q -O - ${MINTLIB_URL} | tar xzf -

RUN cd ${MINTLIB_FOLDER} \
    && ../build.sh ${BUILD_DIR}

FROM scratch

# renew the arguments
ARG BUILD_DIR

COPY --from=base ${BUILD_DIR} /
