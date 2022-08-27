#!/bin/bash

cat ./Build/SurfaceDuo2-AARCH64/DEBUG_CLANG38/FV/SM8350_EFI.fd ./ImageResources/dummykernel > ./ImageResources/Zeta/bootpayload.bin

python3 ./ImageResources/mkbootimg.py \
  --kernel ./ImageResources/Zeta/bootpayload.bin \
  --ramdisk ./ImageResources/Zeta/ramdisk \
  -o ./ImageResources/Zeta/uefi.img \
  --pagesize 4096 \
  --header_version 3 \
  --cmdline "" \
  --base 0x0 \
  --os_version 11.0.0 \
  --os_patch_level 2022-05-01

cat ./Build/SurfaceDuo2-AARCH64/DEBUG_CLANG38/FV/SM8350_EFI.fd ./ImageResources/Zeta/kernel > ./ImageResources/Zeta/bootpayload.bin

python3 ./ImageResources/mkbootimg.py \
  --kernel ./ImageResources/Zeta/bootpayload.bin \
  --ramdisk ./ImageResources/Zeta/ramdisk \
  -o ./ImageResources/Zeta/boot.img \
  --pagesize 4096 \
  --header_version 3 \
  --cmdline "" \
  --base 0x0 \
  --os_version 11.0.0 \
  --os_patch_level 2022-05-01