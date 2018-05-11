ARG ARCH=frommakefile
ARG DISTRIB=frommakefile
ARG DOCKERSRC=frommakefile
ARG USERNAME=frommakefile
#
FROM ${USERNAME}/${DOCKERSRC}:${DISTRIB}_${ARCH}
#
RUN apk add --no-cache --purge clamav-daemon clamav clamsmtp clamav-libunrar && rm -rf /var/cache/apk/* 

RUN /usr/bin/freshclam

RUN sed -e 's/#Listen: 0.0.0.0:10025/Listen: 0.0.0.0:10026/g' -i /etc/clamsmtpd.conf
RUN mkdir -p /var/run/clamav/
RUN chown clamav:clamav /var/run/clamav/

EXPOSE 10026

ADD entrypoint.sh /usr/local/entrypoint.sh
RUN chmod 755 /usr/local/entrypoint.sh
ENTRYPOINT ["/usr/local/entrypoint.sh"]
