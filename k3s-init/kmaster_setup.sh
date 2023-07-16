#!/bin/bash
echo "Installing k3s"

{
  # try installing k3s
  curl -sfL https://get.k3s.io | sh - &&
} || {
  # otherwise try setting cgroup_memory config
  echo -n " cgroup_memory=1 cgroup_enable=memory" >> /boot/cmdline.txt
  curl -sfL https://get.k3s.io | sh -
}
echo "All done, rebooting"
reboot