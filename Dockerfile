FROM ubuntu:18.04

# Install calibre deps and then nodejs deps
RUN apt-get update \
    && apt-get install -y \
        sudo\
        wget \
        gcc \
        xz-utils \
        imagemagick \
        xdg-utils \
    && apt-get install -y \
        build-essential \
        curl \
    && apt-get install -y \
        git-core \
    && apt-get clean 

RUN sudo apt purge -y python2.7-minimal

# You already have Python3 but 
# don't care about the version 
RUN sudo ln -s /usr/bin/python3 /usr/bin/python

# Same for pip
RUN sudo apt install -y python3-pip
RUN sudo ln -s /usr/bin/pip3 /usr/bin/pip

# Confirm the new version of Python: 3
RUN python --version
# Install calibre
RUN sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
RUN sudo ln -s /usr/bin/nodejs /usr/bin/node

# Install nodejs
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs

# Install gitbook
RUN npm install --global gitbook-cli && \
    gitbook fetch 3.2.2 && \
    gitbook install && \
    npm cache clear --force && \
    rm -rf /tmp/*


# Config gitbook Fixes https://github.com/GitbookIO/gitbook/issues/1309 
 RUN sed -i.bak 's/confirm: true/confirm: false/g' \
    /root/.gitbook/versions/3.2.2/lib/output/website/copyPluginAssets.js

WORKDIR /srv/gitbook

COPY package*.json ./

COPY book.json ./

ADD pages/ ./pages

RUN pwd

RUN gitbook install

RUN gitbook pdf ./ ./Manual_Versionamento_Codigo.pdf

EXPOSE 4000 35729

CMD gitbook serve