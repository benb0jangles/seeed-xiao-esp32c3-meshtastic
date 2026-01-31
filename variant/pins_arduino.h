#ifndef Pins_Arduino_h
#define Pins_Arduino_h

#include <stdint.h>

// Serial pins (UART)
static const uint8_t TX = 21;
static const uint8_t RX = 20;

// I2C pins (available on SX1262 pass-through D6/D7)
static const uint8_t SDA = 21;  // GPIO21 (D6)
static const uint8_t SCL = 20;  // GPIO20 (D7)

// SPI pins (used by SX1262 radio)
static const uint8_t SS = 6;    // GPIO6 -> NSS
static const uint8_t MOSI = 10; // GPIO10 -> MOSI
static const uint8_t MISO = 9;  // GPIO9 -> MISO
static const uint8_t SCK = 8;   // GPIO8 -> SCK

// Analog pins (ESP32-C3 ADC-capable pins)
static const uint8_t A0 = 0;
static const uint8_t A1 = 1;
static const uint8_t A2 = 2;
static const uint8_t A3 = 3;
static const uint8_t A4 = 4;
static const uint8_t A5 = 5;

#endif /* Pins_Arduino_h */
