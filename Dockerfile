FROM python:3.7-alpine3.8

WORKDIR /WORK

COPY . /WORK

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apk --no-cache add \
    make \
    gawk \
    file \
    autoconf \
    automake \
    gettext \
    readline-dev \
    musl-dev \
    glib-dev \
    pkgconf \
    libtool \
    flex \
    bison \
    gcc \
    g++ \
    swig

RUN cd hfst && \
    ./autogen.sh && \
    ./configure --enable-all-tools --with-unicode-handler=glib --with-readline && \
    make && \
    make install-strip && \
    cd python && \
    python3 setup.py install && \
    python3 setup.py install

RUN rm -rf /WORK/* /WORK/.git*