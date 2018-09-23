#!/bin/bash
[[ -z $1 ]] && device_id=$USB_VENDOR_ID || device_id=$1
[[ -z $2 ]] && device_product=$USB_VENDOR_PRODUCT || device_product=$2
[[ -z $device_id || -z $device_product ]] && { echo "Missing USB environment: 'USB_VENDOR_ID' or 'USB_VENDOR_PRODUCT'"; exit 1; }
usbpath=`lsusb | grep "$device_id:$device_product" | awk '{print $2"/"$4}' | sed 's/.$//'`
[[ -z $usbpath ]] && { echo "Not found USB"; exit 2; }
usbreset /dev/bus/usb/$usbpath