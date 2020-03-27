FROM debian:buster-slim

RUN apt update && apt install -y wget \
                                 parted \
                                 kpartx \
                                 dosfstools \
                                 binutils \
                                 p7zip-full \
                                 sudo \
                                 xz-utils

COPY build-image.sh /builder/build-image
COPY init.preinit /builder/init.preinit
COPY init.resizefs /builder/init.resizefs
COPY orangepipc2-boot.cmd /builder/orangepipc2-boot.cmd
RUN chmod +x /builder/build-image

WORKDIR /builder

VOLUME /builder/config
VOLUME /builder/output

ENTRYPOINT ["/builder/build-image"]
