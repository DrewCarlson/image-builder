FROM debian:bullseye

RUN  \
    sed -i 's,http://httpredir.debian.org/debian,http://ftp.us.debian.org/debian/,' /etc/apt/sources.list && \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python3-pip \
    build-essential \
    libguestfs-tools \
    libncurses5-dev \
    tree \
    debootstrap \
    kpartx \
    lvm2 \
    dosfstools \
    zip \
    unzip \
    pigz \
    awscli \
    ruby \
    ruby-dev \
    shellcheck \
    gpg-agent \
    --no-install-recommends && \
    sed -i 's,http://ftp.us.debian.org/debian/,http://httpredir.debian.org/debian,' /etc/apt/sources.list && \
    rm -rf /var/lib/apt/lists/*

RUN gem install --no-document serverspec && \
    gem install --no-document pry-byebug && \
    gem install --no-document bundler
