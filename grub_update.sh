#!/bin/bash

# Check if the new value is already present in GRUB_CMDLINE_LINUX_DEFAULT
if grep -q "clearcpuid=514" /etc/default/grub; then
  echo "The fix is already present in GRUB_CMDLINE_LINUX_DEFAULT"
  sleep 3
else
  # Backup the original file
  echo "Backup grub..."
  sleep 1
  cp /etc/default/grub /etc/default/grub.bak
  
  # Add the new value to GRUB_CMDLINE_LINUX_DEFAULT
  echo "Adding parameter in grub..."
  sleep 1
  sed -i 's/^\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 clearcpuid=514"/' /etc/default/grub
  
  # Update the GRUB configuration file
  echo "Update grub..."
  sleep 1
  update-grub
  
  # Reboot after a countdown
  for i in {5..1}; do
    echo "Reboot in $i seconds..."
    sleep 1
  done

echo "Reboot!"
shutdown now -r
fi