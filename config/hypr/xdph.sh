#!/usr/bin/env bash
sleep 1
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
killall xdg-desktop-portal-gnome
/usr/lib/xdg-desktop-portal-wlr &
sleep 2
/usr/lib/xdg-desktop-portal &
