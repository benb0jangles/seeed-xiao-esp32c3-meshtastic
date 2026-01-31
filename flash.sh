#!/bin/bash
# Flash script for Seeed XIAO ESP32-C3 + Wio SX1262 Meshtastic Firmware

set -e

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║   Meshtastic Firmware Flasher                             ║"
echo "║   Seeed XIAO ESP32-C3 + Wio SX1262                        ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Check for esptool
if ! command -v esptool.py &> /dev/null; then
    echo "❌ esptool.py not found!"
    echo ""
    echo "Install it with: pip install esptool"
    exit 1
fi

echo "✓ esptool.py found: $(esptool.py version 2>&1 | head -1)"
echo ""

# Firmware file
FIRMWARE="firmware/firmware-seeed-xiao-esp32c3-sx1262-2.7.19.9d06c1b.factory.bin"

if [ ! -f "$FIRMWARE" ]; then
    echo "❌ Firmware file not found: $FIRMWARE"
    exit 1
fi

echo "✓ Firmware found: $FIRMWARE"
echo ""

# Detect port
echo "🔍 Looking for ESP32-C3..."
echo ""

# Auto-detect port
if command -v pio &> /dev/null; then
    PORT=$(pio device list 2>/dev/null | grep -E "/dev/cu.usbmodem|/dev/ttyACM|/dev/ttyUSB|COM" | head -1 | awk '{print $1}')
else
    # Manual detection
    if [ -e /dev/cu.usbmodem* ]; then
        PORT=$(ls /dev/cu.usbmodem* | head -1)
    elif [ -e /dev/ttyACM0 ]; then
        PORT="/dev/ttyACM0"
    elif [ -e /dev/ttyUSB0 ]; then
        PORT="/dev/ttyUSB0"
    fi
fi

if [ -z "$PORT" ]; then
    echo "⚠️  Could not auto-detect port. Please specify manually."
    read -p "Enter port (e.g., /dev/ttyACM0 or COM3): " PORT
fi

echo "📡 Using port: $PORT"
echo ""
echo "⚠️  If flashing fails:"
echo "   1. Hold the BOOT button on the ESP32-C3"
echo "   2. While holding BOOT, press and release RESET"
echo "   3. Release BOOT and try flashing again"
echo ""

read -p "Press Enter to start flashing (or Ctrl+C to cancel)..."

echo ""
echo "🚀 Flashing firmware..."
echo ""

esptool.py --chip esp32c3 --port "$PORT" --baud 921600 \
    write_flash 0x0 "$FIRMWARE"

echo ""
echo "✅ Flashing complete!"
echo ""
echo "📱 Next steps:"
echo "   1. Install Meshtastic app on your phone"
echo "   2. Connect via Bluetooth"
echo "   3. Configure your device name and region"
echo "   4. Start meshing!"
echo ""
echo "📚 Documentation: https://meshtastic.org/docs/"
echo ""
