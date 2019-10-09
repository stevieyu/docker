#! /bin/sh

ss-local -s $SERVER_ADDR -p $SERVER_PORT -b 0.0.0.0 -l $LOCAL_PORT -k $PASSWORD -m $METHOD -t $TIMEOUT -u -v & \
privoxy --no-daemon --user privoxy /etc/privoxy/config