#!/bin/sh

# Bring down ethernet interface and then bring it up again

IF=$1
STATUS=$2
ETH="enp0s25"

if [ "$IF" = "wlp3s0" ]
then
        case "$STATUS" in
                up)
                ip link set $ETH down
		sleep 1s
                ip link set $ETH up
		sleep 3s
		mount 192.168.1.101:/srv/nfshare
                ;;
                *)
                ;;
        esac
fi
