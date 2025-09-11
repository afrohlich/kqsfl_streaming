#!/bin/bash
set -xeuo pipefail

# https://sources.debian.org/src/xfce4-power-manager/1.6.1-1/common/xfpm-config.h
xfconf-query -c xfce4-power-manager --create --property \
  /xfce4-power-manager/dpms-enabled --type bool --set false
xfconf-query -c xfce4-power-manager --create --property \
  /xfce4-power-manager/dpms-on-ac-off --type int --set 0
xfconf-query -c xfce4-power-manager --create --property \
  /xfce4-power-manager/dpms-on-ac-sleep --type int --set 0
xfconf-query -c xfce4-power-manager --create --property \
  /xfce4-power-manager/blank-on-ac --type int --set 0