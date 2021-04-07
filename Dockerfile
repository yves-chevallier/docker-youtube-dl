FROM alpine:latest

RUN apk upgrade --no-cache
RUN apk add --no-cache bash coreutils python3 py3-pip
RUN rm -rf /root/.cache /root/packages
RUN python3 -m pip --no-cache-dir install youtube_dl

COPY config /root/.config/youtube-dl/config
COPY list /root/list

VOLUME /downloads
WORKDIR /downloads

ENTRYPOINT [ "youtube-dl" ]
