#!/bin/bash

# Greeting
echo "Welcome to the GRUB update script!"

# # Backup GRUB configuration
echo "Backing up GRUB configuration..."
for i in {2..1}; do
    sleep 1
done
cp /etc/default/grub /etc/default/grub.bak

# # Inserting a string into GRUB
echo "Inserting string into GRUB..."
for i in {2..1}; do
    sleep 1
done
sed -i 's/^\(GRUB_CMDLINE_LINUX_DEFAULT=".*\)"/\1 clearcpuid=514"/' /etc/default/grub

# # Update GRUB
echo "Updating GRUB..."
update-grub

# Countdown until reboot
echo "Rebooting in 5 seconds..."
for i in {5..1}; do
    echo "$i..."
    sleep 1
done

# # Reboot system
echo "Rebooting now!"
shutdown now -r
