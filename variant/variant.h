// Pin definitions for Seeed XIAO ESP32-C3 with Wio SX1262 LoRa module
// Based on stacked configuration with aligned power pins

#define BUTTON_PIN 9  // GPIO9 available for button

// LED - Using GPIO2 (D0) which is available
#define LED_PIN 2     // GPIO2 (D0)
#define LED_STATE_ON 1

#define HAS_SCREEN 0
#define HAS_GPS 0
#undef GPS_RX_PIN
#undef GPS_TX_PIN

// SX1262 LoRa Radio Configuration
// Pin mapping when Wio SX1262 is stacked on Seeed XIAO ESP32-C3
#define USE_SX1262

// SPI pins (left side when stacked)
#define LORA_SCK 8    // GPIO8 -> SX1262 SCK
#define LORA_MISO 9   // GPIO9 -> SX1262 MISO
#define LORA_MOSI 10  // GPIO10 -> SX1262 MOSI

// Control pins (right side when stacked)
#define LORA_CS 6     // GPIO6 (D4) -> SX1262 NSS
#define LORA_RESET 4  // GPIO4 (D2) -> SX1262 RST
#define LORA_DIO1 3   // GPIO3 (D1) -> SX1262 DIO1
#define LORA_BUSY 5   // GPIO5 (D3) -> SX1262 BUSY

// SX1262 specific settings
#define LORA_DIO0 RADIOLIB_NC
#define LORA_DIO2 RADIOLIB_NC
#define SX126X_CS LORA_CS
#define SX126X_DIO1 LORA_DIO1
#define SX126X_BUSY LORA_BUSY
#define SX126X_RESET LORA_RESET
#define SX126X_DIO2_AS_RF_SWITCH  // Wio SX1262 uses DIO2 for RF switching
#define SX126X_DIO3_TCXO_VOLTAGE 1.8  // Wio SX1262 has 1.8V TCXO

// I2C pins for external sensors (available on pass-through pins D6/D7)
// These are available when using SX1262 module
#define I2C_SDA 21    // GPIO21 (D6) -> SX1262 D6 (pass-through)
#define I2C_SCL 20    // GPIO20 (D7) -> SX1262 D7 (pass-through)
