#!/bin/sh

# Change the metric of the default route only on interface wlp3s0

IF=$1
STATUS=$2
MY_METRIC=1
MY_METRIC_2=600

if [ "$IF" = "wlp3s0" ]
then
        case "$STATUS" in
                up)
                ip route del default dev $IF
                ip route add default via $DHCP4_ROUTERS dev $IF proto dhcp metric $MY_METRIC
                ;;
                *)
                ;;
        esac
fi
