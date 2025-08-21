#!/bin/bash

set -euo pipefail

echo "Configure Wifi? (yes/no): "
read configure_wifi

if [[ "$configure_wifi" != "yes" ]] ; then exit ; fi

echo "Available network adapters:"
ip link show | sed -n '/^[0-9]*:/p'

echo "Enter adapter to use: "
read wifi_adapter  < /dev/console > /dev/console 2>&1
echo "Enter SSID: "
read ssid   < /dev/console > /dev/console 2>&1
echo "Enter Password: "
read -s password  < /dev/console > /dev/console 2>&1
echo ""

cat > /etc/netplan/99-wifi.yaml << NETPLAN
network:
  version: 2
  wifis:
    $wifi_adapter:
      access-points:
        "$ssid":
          password: "$password"
      dhcp4: true
NETPLAN

cat /etc/netplan/99-wifi.yaml

chmod 600 /etc/netplan/99-wifi.yaml
netplan apply