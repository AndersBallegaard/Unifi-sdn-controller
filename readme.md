# Unifi Network Controller Docker image
This is an unofficial docker image for unifi network controller

Check it out on Docker Hub: https://hub.docker.com/r/andersballegaard/unifi-sdn-controller

## How to run
Since the image use systemd this container needs to run as a priviledged container with access to cgroups. Remember to take manual backups once in a while.

The following command is the recomended way of running it
```bash
docker run --name unifi-controller \
    -p 8000:8443 \
    --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -d andersballegaard/unifi-sdn-controller
```

## Update unifi Network controller version
1. Go to https://www.ui.com/download/unifi
2. Find the latest version of Unifi network controller for Debian/ubuntu and copy the direct url
3. Update Dockerfile with the new url (see example for version 5.13.29)
```dockerfile
RUN wget https://dl.ui.com/unifi/5.13.29/unifi_sysvinit_all.deb -O unifi_controller.deb
```
4. Build the docker image
```bash
docker build -t andersballegaard/unifi-sdn-controller .
```