#!/bin/bash

apt-get update
apt-get install -y --no-install-recommends linux-image-686 live-boot systemd-sysv
apt-get clean

exit

