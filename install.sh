#!/bin/sh
wget --no-check-certificate https://raw.githubusercontent.com/didepanlayar/OpenWRT-OpenClash-Auto-Reconnect/master/sbin/clash-network.sh -O /sbin/get_net && chmod +x /sbin/get_net
rm -f /tmp/install.sh