# debian-custom-live-boot

Requires docker-compose

1. Clone repository
2. Make changes to `custom_config/run.sh`
3. Run `make`

Create bootable usb:

```
sudo umount /dev/<usb drive like sdb>

sudo dd if=output/debian-custom.iso of=/dev/disk<?> bs=4m
``
