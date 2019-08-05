FROM debian:bullseye
MAINTAINER Bret Palsson <bretep@gmail.com> 

RUN apt-get update && \
    apt-get install -y make debootstrap squashfs-tools xorriso grub-pc-bin grub-efi-amd64-bin mtools dosfstools 

RUN mkdir LIVE_BOOT && \
    debootstrap --arch=i386 --variant=minbase stretch ./LIVE_BOOT/chroot http://ftp.us.debian.org/debian/

ADD ./build_chroot.sh LIVE_BOOT/chroot/build_chroot.sh
RUN chmod +x LIVE_BOOT/chroot/build_chroot.sh

RUN chroot LIVE_BOOT/chroot ./build_chroot.sh
RUN rm LIVE_BOOT/chroot/build_chroot.sh        

ADD ./custom_config LIVE_BOOT/chroot/custom_config
RUN chmod +x LIVE_BOOT/chroot/custom_config/run.sh

ADD ./grub.cfg LIVE_BOOT/scratch/grub.cfg

ADD ./Makefile.docker Makefile

VOLUME /output

CMD ["make"]
