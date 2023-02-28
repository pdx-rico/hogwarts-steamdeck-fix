#!/bin/bash

# Check if the new value is already present in GRUB_CMDLINE_LINUX_DEFAULT
if grep -q "clearcpuid=514" /etc/default/grub; then
  echo "The fix is already present in GRUB_CMDLINE_LINUX_DEFAULT"
else
  # Backup the original file
  for i in {2..1}; do
    sleep 1
  done

  cp /etc/default/grub /etc/default/grub.bak
  
  # Add the new value to GRUB_CMDLINE_LINUX_DEFAULT
  for i in {2..1}; do
    sleep 1
  done

  sed -i 's/^\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 clearcpuid=514"/' /etc/default/grub
  
  # Update the GRUB configuration file
  update-grub
  
  # Reboot after a countdown
  echo "Rebooting in 10 seconds..."
  sleep 5
  shutdown now -r
fi