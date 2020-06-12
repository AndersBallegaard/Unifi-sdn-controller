FROM debian:9

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive



RUN mkdir /unifi

WORKDIR /unifi

RUN apt-get update
RUN apt-get install -y systemd systemd-sysv
RUN apt-get install wget -y


RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*


RUN wget https://dl.ui.com/unifi/5.13.29/unifi_sysvinit_all.deb -O unifi_controller.deb
RUN apt --fix-broken install ./unifi_controller.deb -y

VOLUME [ "/sys/fs/cgroup" ]
VOLUME [ "/usr/lib/unifi/data/backup/autobackup" ]

CMD ["/lib/systemd/systemd"]

