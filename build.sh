#!/bin/bash

cat ./Build/SurfaceDuo2-AARCH64/DEBUG_CLANG38/FV/SM8350_EFI.fd ./ImageResources/dummykernel > ./bootpayload.bin

python3 ./ImageResources/mkbootimg.py \
  --kernel ./bootpayload.bin \
  --ramdisk ./ImageResources/ramdisk \
  -o ./uefi.img \
  --pagesize 4096 \
  --header_version 3 \
  --cmdline "" \
  --base 0x0 \
  --os_version 11.0.0 \
  --os_patch_level 2022-05-01

cat ./Build/SurfaceDuo2-AARCH64/DEBUG_CLANG38/FV/SM8350_EFI.fd ./ImageResources/kernel > ./bootpayload.bin

python3 ./ImageResources/mkbootimg.py \
  --kernel ./bootpayload.bin \
  --ramdisk ./ImageResources/ramdisk \
  -o ./boot.img \
  --pagesize 4096 \
  --header_version 3 \
  --cmdline "" \
  --base 0x0 \
  --os_version 11.0.0 \
  --os_patch_level 2022-05-01