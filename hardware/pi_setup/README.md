# Setup & maintain Pis using Ansible


## common point of start
The point of start will be freshly etched storages. Pi imager will automatically set the hostname, add my pub ssh key and disallow password ssh attempts. installing using an SD card first and running `sudo rpi-update` might be the way before being able to run directly off SSD



## Flash PI BIOS if needed to support SSD boot?
noticed that older versions of raspi 4b BIOS didnt support booting directly from an etched SSD.

## set locale
```bash
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen en_US.UTF-8
```

## set c group flags
add the following to end of `/boot/firmware/cmdline.txt`: `cgroup_enable=memory cgroup_memory=1`
TODO: needed still for current linux versions?

## updates
```bash
sudo apt update
sudo apt upgrade -y
```

## LEDs
need to edit `/boot/config.txt`
full disable:
```conf
#Disable Power LED (Red)
dtparam=pwr_led_activelow=off
#Disable Activity LED (Green) -- Wont do it for now
#dtparam=act_led_trigger=none
#dtparam=act_led_activelow=off
#Disable LAN LEDs
dtparam=eth_led0=14
dtparam=eth_led1=14
```

## Reboot
```bash
sudo reboot
```