#!/bin/bash

echo "debian-live" > /etc/hostname
mkdir -p /etc/systemd/system/getty@.service.d
cp /custom_config/root-auto-login.conf /etc/systemd/system/getty@.service.d/override.conf
cp /custom_config/bashrc /root/.bashrc

apt-get clean

exit

