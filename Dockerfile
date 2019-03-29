FROM python:3.7-alpine3.9 as builder


ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apk --no-cache add \
    autoconf \
    automake \
    bison \
    build-base \
    flex \
    gawk \
    gettext \
    glib-dev \
    libtool \
    pkgconf \
    readline-dev \
    swig \
    ;

WORKDIR /hfst
COPY ./hfst .

RUN ./autogen.sh
RUN ./configure \
    --enable-all-tools \
    --with-unicode-handler=glib \
    --with-readline \
    ;
RUN make
RUN make install-strip
RUN cd python ; python setup.py build_ext --inplace
RUN cd python ; python setup.py install


FROM python:3.7-alpine3.9

RUN apk --no-cache add \
    libgcc \
    libstdc++ \
    musl \
    readline \
    ;

COPY --from=builder /usr/local/ /usr/local/
