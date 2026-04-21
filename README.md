# Android Device Tree for Redmi A5 (serenity)

## Description
This repository contains the Device Tree for the **Redmi A5 (codenamed serenity)** based on Android 15 (LineageOS 22.1).

## Specifications
- **SoC**: Unisoc T606 (qogirl6)
- **CPU**: Octa-core (2x1.6 GHz Cortex-A75 & 6x1.6 GHz Cortex-A55)
- **GPU**: Mali-G57 MP1
- **Android Version**: 15 (Initial release)
- **Storage/Filesystem**: EROFS (Super partition)
- **Architecture**: A/B Partitions

## Current Status
- [x] Kernel extracted (v4 Header)
- [x] DTB extracted from vendor_boot
- [x] DTBO included
- [x] Basic BoardConfig.mk for Android 15
- [x] EROFS mount points configured
- [ ] Proprietary Blobs (Vendor)
- [ ] Hardware HALs (Unisoc)

## How to build
```bash
# Initialize ROM repo
repo init -u https://github.com/LineageOS/android.git -b lineage-22.1

# Sync
repo sync

# Clone this tree
git clone https://github.com/SrJeffreyI/RedmiA5_device_xiaomi_serenity.git device/xiaomi/serenity

# Build
source build/envsetup.sh
lunch lineage_serenity-userdebug
mka bacon
```
