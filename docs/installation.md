# esp32_cnc3018 - Installation

**[Home](readme.md)** --
**[History](history.md)** --
**[Hardware](hardware.md)** --
**[Electronics](electronics.md)** --
**[Software](software.md)** --
**Installation**
**[Version2](version2.md)** --


Some of these instructions are duplicated on and/or reference other pages.
Please follow the links to download and install the various pieces.

## 1. Prepare the Arduino IDE

- install the [**Arduino IDE**](https://www.arduino.cc/en/software)
- add the [**ESP32 board**](https://docs.espressif.com/projects/arduino-esp32/en/latest/installing.html)
to the Arduino IDE using the *Boards Manager*
- add the [**Arduino ESP32 filesystem uploader**](https://github.com/me-no-dev/arduino-esp32fs-plugin)
to your Arduino Sketch "tools" folder

## 2. Get the Source Code

Start by copying or cloning **this repository** into a folder called **esp32_cnc3018**
within your Arduino Sketch folder.

You then need to add a number of libraries to your **Arduino/libraries** folder.
Some of these libraries have additional dependencies on other libraries.
Please follow the instructions on the linked pages to install each library and it's dependencies.

- install my version of the [**FluidNC**](https://github.com/phorton1/Arduino-libraries-FluidNC) library and it's dependencies
- install my [**FluidNC_Extensions**](https://github.com/phorton1/Arduino-libraries-FluidNC_Extensions) library
- If you are building the machine with the (optional) TFT Display
 (by default **WITH_UI** is defined in cnc3018.h),
 then install my [**FluidNC_UI**](https://github.com/phorton1/Arduino-libraries-FluidNC_UI) library
- If you are building the machine with the (optional) ws2812b LEDS
 (by default **WITH_PIXELS** is defined in cnc3018.h)
 then install the **Adafruit Neopixel** library using the Arduino *Library Manager*

## 3. Build/Flash the Firmware and upload the SPIFFS

- open the **esp32_cnc3018.ino** sketch in the Arduino IDE
- select the **ESP32 Dev Module** board from the Arduino *Tools-Boards* menu
- select the **Minimal SPIFFS** (1.9MB App with OTA/190KB SPIFFS) from the *Tools-Partition Scheme* menu
- select the correct **COM Port** for the ESP32
- build and upload the firmware using the Arduino IDE **Verify/Compile/Upload** commands
- upload the contents of the cnc3018_esp32 *data folder* to the ESP32 *SPIFFS* using the **Tools - ESP32 Sketch Data Upload** command

<br>

## 4. Access the esp32_cnc3018 machine via the Arduino Serial Monitor

You should now be able to open the Arduino Serial Monitor (set it to **115200 baud**) and access the esp32_cnc3018 machine
via the USB serial port.  You should see something like this:

![arduino_serial_monitor.jpg](images/arduino_serial_monitor.jpg)

You can now send GRBL (Gcode) commands to the machine by entering them into the
Arduino Serial Monitor and pressing the **Send** button.  Each time you press the
Send button, the machine should reply with **ok** in the Serial Monitor.

<br>

## 5. Format and prepare a FAT32 SD Card

Assuming that you are using the SDCard, please prepare one
by formatting it as necessary.

- The size of the SD Card is not very important.
- The machine can handle up to 32GB cards.
- Some work better than others.
- If at first it doesn't work, try turning everything off and
on, and re-inserting it the SD module.
- If you can't get it working, try a different SD card.

You can put files on the SD Card with your computer. You can also
connect to the ESP32 via Wifi and upload/delete files from the SDCard
using the **Web UI**.   You can *list* and *run* files on it from the
**Serial Port** via the *$sd/list* and *$sd/run=* commands,
or via **Touch Screen UI** *Files* window.


<br>

## 6. Connect to the machine with the Web UI

By default the machine will present itself as a Wifi Access Point called **FluidNC**

- connect your computer or phone to the **FluidNC** Wifi Access Point
- the default password is **12345678**

As soon as you connect to the FluidNC access point, a browser should pop up
and you should see the Web UI for the machine:

![FluidNC_WebUI.jpg](images/FluidNC_WebUI.jpg)

If that does not happen, you ***may*** be able to access it, once connected,
via the default IP address of **10.0.0.1**.


### Configuring the Wifi

There are a number of commands that you can use to configure
WiFi access to the esp32_cnc3018 machine.

You can make it connect to your
existing Wifi network by issuing the following commands:

```yaml
$Sta/SSID=YOUR_NET_SSID
$Sta/password=YOUR_NET_PASSWORD
```

You can then connect to it using the IP address given by your router,
which you can see either in the Serial Terminal Window at startup,
or at the top, in the Title Bar, of the Touch Screen UI.

It is beyond the scope of this page to describe all of the commands
and techniques that you can use to configure and modify the machine.
But if you have gotten this far, you can see there
are a number of different approaches available.

<br>

## 7. Finished!!

**Congratulations!  You now have prepared the firmware for a esp32_cnc3018 machine!**


<br>
<hr>
<div style="text-align: right">
<a href='version2.md'>Version2</a> - a <b>second</b> , <i>bigger and more powerful</i> 3018 machine ...
</div>
