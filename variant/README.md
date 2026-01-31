# Seeed XIAO ESP32-C3 + Wio SX1262 LoRa Module

This variant is designed for the **Seeed XIAO ESP32-C3** stacked with the **Wio SX1262 LoRa module**.

## Hardware Configuration

### Stacking Configuration
Both modules have 2.54mm header pinouts with 7 pins per side. When stacked, the power pins align:
- ESP32-C3 **5V** → SX1262 **VCC**
- ESP32-C3 **GND** → SX1262 **GND**
- ESP32-C3 **3.3V** → SX1262 **3.3V**

### Pin Mappings

#### Left Side (SPI Interface)
| ESP32-C3 Pin | SX1262 Pin | Function |
|--------------|------------|----------|
| 5V | VCC | Power |
| GND | GND | Ground |
| 3.3V | 3.3V | Power |
| D10 (GPIO10) | MOSI | SPI Data Out |
| D9 (GPIO9) | MISO | SPI Data In |
| D8 (GPIO8) | SCK | SPI Clock |
| D7 (GPIO20) | D7 | Pass-through (I2C SCL) |

#### Right Side (Control Pins)
| ESP32-C3 Pin | SX1262 Pin | Function |
|--------------|------------|----------|
| D0 (GPIO2) | D0 | Pass-through |
| D1 (GPIO3) | DIO1 | LoRa Interrupt |
| D2 (GPIO4) | RST | Radio Reset |
| D3 (GPIO5) | BUSY | Busy Signal |
| D4 (GPIO6) | NSS | SPI Chip Select |
| D5 (GPIO7) | RF_SW | RF Switch Control |
| D6 (GPIO21) | D6 | Pass-through (I2C SDA) |

### I2C Sensor Support
GPIO20 (D7) and GPIO21 (D6) are available via the SX1262 pass-through pins D7 and D6 for external I2C sensors:
- **SDA**: GPIO21 (D6)
- **SCL**: GPIO20 (D7)

Compatible sensors include BME280, BME680, SSD1306 displays, etc.

## Building the Firmware

### Prerequisites
1. Install [PlatformIO](https://platformio.org/)
2. Clone this repository

### Build Command
```bash
cd meshtastic-source
pio run -e seeed-xiao-esp32c3-sx1262
```

### Flash Command
```bash
pio run -e seeed-xiao-esp32c3-sx1262 -t upload
```

Or specify the port:
```bash
pio run -e seeed-xiao-esp32c3-sx1262 -t upload --upload-port /dev/ttyACM0
```

## Hardware Model
- **Hardware Model ID**: 254
- **Slug**: SEEED_XIAO_ESP32C3
- **Display Name**: Seeed XIAO ESP32-C3 + SX1262

## References
- [Seeed XIAO ESP32-C3 Wiki](https://wiki.seeedstudio.com/XIAO_ESP32C3_Getting_Started/)
- [Wio SX1262 Module Wiki](https://wiki.seeedstudio.com/wio_sx1262/)
