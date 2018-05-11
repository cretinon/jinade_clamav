#!/bin/sh

touch /var/log/clamav/clamav.log
chown clamav:clamav /var/log/clamav/clamav.log

freshclam -d 
clamsmtpd 
/usr/sbin/clamd -c /etc/clamav/clamd.conf 

tail -f /var/log/clamav/clamav.log
