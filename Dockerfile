# O codigo base para esse docker file pode ser encontrado nos links: 
#  https://bl.ocks.org/eiri/543c7640323579fe2a6871213ff36933
#  https://github.com/linuxserver/docker-calibre/blob/master/Dockerfile

# Base image 
FROM ubuntu:18.04

# Disables the necessary isolation to generate the pdf through gitbook.
ENV QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox"

# Install calibre deps and then nodejs deps
RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    curl\
    imagemagick \
    xdg-utils \
    git-core \
    gcc &&\
  apt-get install -y --no-install-recommends \
    dbus \
    fcitx-rime \
    fonts-wqy-microhei \
    jq \
    libnss3 \
    libqpdf21 \
    libxkbcommon-x11-0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    python3 \
    python3-xdg \
    ttf-wqy-zenhei \
    wget \
    xz-utils

# Install calibre 5.34
RUN mkdir -p /opt/calibre && \
  curl -o /tmp/calibre-tarball.txz -L "https://download.calibre-ebook.com/5.34.0/calibre-5.34.0-x86_64.txz" && \
  tar xvf /tmp/calibre-tarball.txz -C /opt/calibre && \
  /opt/calibre/calibre_postinstall && \
  dbus-uuidgen > /etc/machine-id

# Install nodejs 8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash && \
  apt-get install -y nodejs

# Install gitbook
RUN npm install --global gitbook-cli && \
  gitbook fetch 3.2.3 && \
  gitbook install && \
  npm cache clear --force && \
  rm -rf /tmp/* && \
  # Config gitbook Fixes https://github.com/GitbookIO/gitbook/issues/1309 
  sed -i.bak 's/confirm: true/confirm: false/g' \
  /root/.gitbook/versions/3.2.3/lib/output/website/copyPluginAssets.js

# Cleanup
RUN apt-get clean && \
  rm -rf \
  /tmp/* \
  /var/lib/apt/lists/* \
  /var/tmp/*


WORKDIR /var/www/html/gitbook

COPY . .

RUN gitbook install 

RUN gitbook pdf ./ ./pages/public/ebook.pdf

EXPOSE 4000 35729

CMD gitbook serve

