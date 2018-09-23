#!/bin/bash
[[ -z $USB_VENDOR_ID || $USB_VENDOR_PRODUCT ]] && { echo "Missing USB environment: 'USB_VENDOR_ID' or 'USB_VENDOR_PRODUCT'"; exit 1; }
usbpath=`lsusb | grep "$USB_VENDOR_ID:$USB_VENDOR_PRODUCT" | awk '{print $2"/"$4}' | sed 's/.$//'`
[[ -z $usbpath ]] && { echo "Not found USB"; exit 2; }
usbreset /dev/bus/usb/$usbpath