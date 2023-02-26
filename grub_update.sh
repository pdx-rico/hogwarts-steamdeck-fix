#!/bin/bash

# Greeting
echo "Welcome to the GRUB update script!"

# Backup GRUB configuration
echo "Backing up GRUB configuration..."
cp /etc/default/grub /etc/default/grub.bak

# Inserting a string into GRUB
echo "Inserting string into GRUB..."
echo "GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash new_string\"" >> /etc/default/grub

# Update GRUB
echo "Updating GRUB..."
update-grub

# # Countdown until reboot
# echo "Rebooting in 10 seconds..."
# for i in {10..1}; do
#     echo "$i..."
#     sleep 1
# done

# # Reboot system
# echo "Rebooting now!"
# shutdown now -r