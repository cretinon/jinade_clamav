ARG ARCH=frommakefile
ARG DISTRIB=frommakefile
ARG DOCKERSRC=frommakefile
ARG USERNAME=frommakefile
#
FROM ${USERNAME}/${DOCKERSRC}:${DISTRIB}_${ARCH}
#
RUN apt-get update && apt-get -y -q install --no-install-recommends clamav-daemon clamav clamsmtp && apt-get clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN /usr/bin/freshclam

RUN sed -e 's/Listen: 127.0.0.1:10026/Listen: 0.0.0.0:10026/g' -i /etc/clamsmtpd.conf
RUN mkdir -p /var/run/clamav/
RUN chown clamav:clamav /var/run/clamav/

EXPOSE 10026

ADD entrypoint.sh /usr/local/entrypoint.sh
RUN chmod 755 /usr/local/entrypoint.sh
ENTRYPOINT ["/usr/local/entrypoint.sh"]
