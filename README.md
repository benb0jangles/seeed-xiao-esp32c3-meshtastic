# Meshtastic Firmware for Seeed XIAO ESP32-C3 + Wio SX1262

Custom Meshtastic firmware for the **Seeed XIAO ESP32-C3** with **Wio SX1262 LoRa module** in stacked configuration.

![Version](https://img.shields.io/badge/meshtastic-v2.7.19-blue)
![Hardware](https://img.shields.io/badge/hardware-ESP32--C3-green)
![Radio](https://img.shields.io/badge/radio-SX1262-orange)

## 📦 Hardware Requirements

- [Seeed XIAO ESP32-C3](https://wiki.seeedstudio.com/XIAO_ESP32C3_Getting_Started/) development board
- [Wio SX1262 LoRa module](https://wiki.seeedstudio.com/wio_sx1262/) (868MHz/915MHz depending on region)
- 2.54mm headers for stacking (both modules have 7 pins per side)
- LoRa antenna compatible with your frequency band

## 🔌 Hardware Setup

### Stacking Configuration

The modules stack directly with **power pins aligned**:

```
ESP32-C3 (bottom)          Wio SX1262 (top)
─────────────────          ────────────────
Left Side:                 Left Side:
  5V          ────────────   VCC
  GND         ────────────   GND
  3.3V        ────────────   3.3V
  D10 (GPIO10)────────────   MOSI
  D9  (GPIO9) ────────────   MISO
  D8  (GPIO8) ────────────   SCK
  D7  (GPIO20)────────────   D7 (pass-through)

Right Side:                Right Side:
  D0  (GPIO2) ────────────   D0 (pass-through)
  D1  (GPIO3) ────────────   DIO1
  D2  (GPIO4) ────────────   RST
  D3  (GPIO5) ────────────   BUSY
  D4  (GPIO6) ────────────   NSS
  D5  (GPIO7) ────────────   RF_SW
  D6  (GPIO21)────────────   D6 (pass-through)
```

### Pin Mapping Summary

| Function | ESP32-C3 Pin | SX1262 Pin |
|----------|--------------|------------|
| SPI MOSI | GPIO10 (D10) | MOSI |
| SPI MISO | GPIO9 (D9) | MISO |
| SPI SCK | GPIO8 (D8) | SCK |
| Chip Select | GPIO6 (D4) | NSS |
| Reset | GPIO4 (D2) | RST |
| Busy | GPIO5 (D3) | BUSY |
| Interrupt | GPIO3 (D1) | DIO1 |
| RF Switch | Internal DIO2 | RF_SW |
| I2C SDA | GPIO21 (D6) | D6 (pass-through) |
| I2C SCL | GPIO20 (D7) | D7 (pass-through) |

## 🚀 Installation

### Method 1: Web Flasher (Easiest)
1. Connect your Seeed XIAO ESP32-C3 via USB
2. Visit [Meshtastic Web Flasher](https://flasher.meshtastic.org/)
3. Upload the `firmware-seeed-xiao-esp32c3-sx1262-2.7.19.9d06c1b.factory.bin` file
4. Follow the on-screen instructions

### Method 2: esptool.py
```bash
# Install esptool if needed
pip install esptool

# Flash the firmware (adjust port as needed)
esptool.py --chip esp32c3 --port /dev/ttyACM0 --baud 921600 \
  write_flash 0x0 firmware/firmware-seeed-xiao-esp32c3-sx1262-2.7.19.9d06c1b.factory.bin
```

**macOS**: Use `/dev/cu.usbmodem*` or `/dev/tty.usbmodem*`
**Windows**: Use `COM3`, `COM4`, etc.
**Linux**: Use `/dev/ttyUSB0` or `/dev/ttyACM0`

### Method 3: PlatformIO (Advanced)
Clone the source and build yourself - see build instructions in the wiki.

## ⚙️ Configuration

After flashing:
1. Install the Meshtastic app on your phone ([iOS](https://meshtastic.org/docs/software/apple/installation/) / [Android](https://meshtastic.org/docs/software/android/installation/))
2. Connect via Bluetooth
3. Set your device name and region
4. Join or create channels

## ✨ Features

- ✅ **Full Meshtastic support** - Messaging, position sharing, telemetry
- ✅ **SX1262 LoRa radio** - Long range mesh networking
- ✅ **I2C sensor support** - GPIO20/21 available for BME280, OLED displays, etc.
- ✅ **Compact form factor** - Stackable design saves space
- ✅ **Low power consumption** - Perfect for portable nodes

## 🔧 Adding I2C Sensors (Optional)

The pass-through pins D6 and D7 provide I2C connectivity:
- **SDA**: GPIO21 (D6)
- **SCL**: GPIO20 (D7)

Compatible sensors:
- BME280/BME680 (temperature, humidity, pressure)
- SSD1306 OLED display (128x64)
- Any I2C sensor at 3.3V

Connect sensors to the pass-through pins and share 3.3V/GND.

## 📊 Specifications

- **MCU**: ESP32-C3 (RISC-V, 160MHz, 400KB SRAM, 4MB Flash)
- **Radio**: Semtech SX1262 (LoRa, -148dBm sensitivity)
- **Frequency**: 868MHz or 915MHz (region dependent)
- **Transmit Power**: Up to +22dBm
- **Bluetooth**: BLE 5.0
- **WiFi**: 2.4GHz 802.11b/g/n

## 🐛 Troubleshooting

**"Error no interface"**
- Ensure antenna is connected to the SX1262
- Verify modules are properly seated on headers
- Check power pins are aligned correctly

**No nodes appear**
- Verify region settings match nearby nodes
- Check channel configuration
- Ensure antenna is connected
- Test range (LoRa needs line of sight for best results)

**Can't flash firmware**
- Hold BOOT button while connecting USB
- Try a different USB cable (some are power-only)
- Check port with `pio device list` or device manager

## 📚 Resources

- [Meshtastic Documentation](https://meshtastic.org/docs/)
- [Seeed XIAO ESP32-C3 Wiki](https://wiki.seeedstudio.com/XIAO_ESP32C3_Getting_Started/)
- [Wio SX1262 Module Wiki](https://wiki.seeedstudio.com/wio_sx1262/)
- [Meshtastic Discord](https://discord.gg/meshtastic)

## 📝 Firmware Details

- **Version**: 2.7.19.9d06c1b
- **Build Date**: 2026-01-31
- **Hardware Model**: 254 (SEEED_XIAO_ESP32C3)
- **Radio**: SX1262 with DIO2 RF switching, 1.8V TCXO

## 🤝 Contributing

Found a bug or have a suggestion? Open an issue or submit a pull request!

## ⚖️ License

This firmware is based on [Meshtastic](https://github.com/meshtastic/firmware) (GPL-3.0).

## 🙏 Credits

- [Meshtastic Project](https://meshtastic.org/) - Open source mesh networking
- [Seeed Studio](https://www.seeedstudio.com/) - XIAO ESP32-C3 hardware
- Community contributors and testers

---

**⚠️ Important**: Always use an appropriate antenna for your region and frequency. Never transmit without an antenna - this can damage the radio module!
