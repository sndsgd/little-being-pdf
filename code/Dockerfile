FROM ubuntu:18.04

# install essentials
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        software-properties-common \
        ca-certificates \
        locales \
        curl \
        unzip \
    && locale-gen en_US \
    && locale-gen en_US.UTF-8

# set system-wide locale settings
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y --no-install-recommends \
        fontconfig \
        libxrender1 \
        xfonts-75dpi \
        xfonts-base \
        libjpeg-turbo8 \
        libxext6 \
    && curl -L https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb --output /tmp/wkhtmltopdf.deb \
    && dpkg -i /tmp/wkhtmltopdf.deb \
    && rm /tmp/wkhtmltopdf.deb

RUN add-apt-repository ppa:ondrej/php \
    && apt-get update

RUN apt-get install -y --no-install-recommends \
    php7.3-cli \
    php7.3-gd \
    php7.3-mbstring \
    php7.3-yaml

RUN curl -L https://github.com/composer/composer/releases/download/1.8.6/composer.phar --output /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

RUN mkdir /var/code
COPY code/composer.json /var/code/composer.json
COPY code/composer.lock /var/code/composer.lock
RUN /usr/local/bin/composer --working-dir=/var/code --no-ansi --no-dev install
COPY code /var/code

