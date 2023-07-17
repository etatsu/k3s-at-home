#!/bin/bash
printf "Run sudo ./kmaster_info.sh on your master node for the next commands!\n"
read -p "Enter the IP address of the master node: " kmaster_ip
read -p "Enter the token from the master node: " token

{
  # try installing k3s
  curl -sfL https://get.k3s.io | K3S_URL=https://$kmaster_ip:6443 K3S_TOKEN=$token sh -
} || {
  # otherwise try setting cgroup_memory config
  echo -n " cgroup_memory=1 cgroup_enable=memory" >> /boot/cmdline.txt
  curl -sfL https://get.k3s.io | K3S_URL=https://$kmaster_ip:6443 K3S_TOKEN=$token sh -
}
echo "All done, rebooting"
reboot