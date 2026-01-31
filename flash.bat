@echo off
REM Flash script for Seeed XIAO ESP32-C3 + Wio SX1262 Meshtastic Firmware

echo ============================================================
echo    Meshtastic Firmware Flasher
echo    Seeed XIAO ESP32-C3 + Wio SX1262
echo ============================================================
echo.

REM Check for esptool
where esptool.py >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [X] esptool.py not found!
    echo.
    echo Install it with: pip install esptool
    pause
    exit /b 1
)

echo [+] esptool.py found
echo.

REM Firmware file
set FIRMWARE=firmware\firmware-seeed-xiao-esp32c3-sx1262-2.7.19.9d06c1b.factory.bin

if not exist "%FIRMWARE%" (
    echo [X] Firmware file not found: %FIRMWARE%
    pause
    exit /b 1
)

echo [+] Firmware found: %FIRMWARE%
echo.

REM Get COM port from user
echo Looking for ESP32-C3...
echo.
echo Please check Device Manager for the correct COM port.
echo Common ports: COM3, COM4, COM5, etc.
echo.
set /p PORT="Enter COM port (e.g., COM3): "

echo.
echo [!] If flashing fails:
echo    1. Hold the BOOT button on the ESP32-C3
echo    2. While holding BOOT, press and release RESET
echo    3. Release BOOT and try flashing again
echo.

pause

echo.
echo [*] Flashing firmware to %PORT%...
echo.

esptool.py --chip esp32c3 --port %PORT% --baud 921600 write_flash 0x0 "%FIRMWARE%"

echo.
echo [+] Flashing complete!
echo.
echo Next steps:
echo    1. Install Meshtastic app on your phone
echo    2. Connect via Bluetooth
echo    3. Configure your device name and region
echo    4. Start meshing!
echo.
echo Documentation: https://meshtastic.org/docs/
echo.

pause
