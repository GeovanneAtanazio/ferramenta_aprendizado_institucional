#O código base para esse docker file pode ser encontrado no link a seguir: https://bl.ocks.org/eiri/543c7640323579fe2a6871213ff36933

FROM alpine:3.15

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1
 
RUN npm install --global gitbook-cli && \
    gitbook fetch 3.2.2 && \
    gitbook install && \
    npm cache clear --force && \
    rm -rf /tmp/*
    
RUN apk add --update python3 py3-pip python3-dev

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin install_dir=~/calibre-bin isolated=y



# Fixes https://github.com/GitbookIO/gitbook/issues/1309 
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