# OrangeFox device tree for Xiaomi 12X

# Device specifications

| Device       | Xiaomi 12X                                                 |
| -----------: | :----------------------------------------------------------|
| SoC          | Qualcomm SM8250 Snapdragon 870 5G                          |
| CPU          | 8x Qualcomm® Kryo™ 585 up to 2.84GHz                       |
| GPU          | Adreno 650                                                 |
| Memory       | 8GB / 12GB                                                 |
| Shipped Android version | 11                                              |
| Storage      | 128GB  (UFS 3.1)                                           |
| Battery      | Li-Po 4520 mAh, non-removable                              |
| Dimensions   | 163.7 x 76.4 x 7.8 mm                                      |
| Display      | 1080 x 2400 (20:9), 6.28 inches                            |

## Features

**Works**

- Booting.
- **Decryption** (Android 12+)
- ADB
- MTP
- OTG
- vA/B partition functions
- Vibration

Other: POCO F3 and POCO F4 use a Virtual A/B Partition Scheme!

## Building

You can find a full compile guide for OrangeFox [Here](https://wiki.orangefox.tech/en/dev/building)

_Lunch_ command :

For **psyche** :
```
lunch twrp_psyche-eng && mka adbd bootimage
```

## Credits
- [Original alioth tree by Nebrassy](https://github.com/TeamWin/android_device_xiaomi_alioth)
- [Immensity kernel for alioth](https://github.com/PixelPlusUI-Devices/kernel_xiaomi_alioth.git)
