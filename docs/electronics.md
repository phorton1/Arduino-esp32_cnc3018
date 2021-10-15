# CNC3018_ESP - Electronics

**[Home](readme.md)** --
**[History](history.md)** --
**[Hardware](hardware.md)** --
**[3D Printing](3dPrinting.md)** --
**Electronics** --
**[Software](software.md)** --
**[Installation](installation.md)**


This page contains the circuit schematics and photos of the printed
circuit boards and their layouts.

The **kiCad** and **flatCam** files can be found in [/docs/kiCad](kiCad), including
all of the *libraries* needed, and the *Gerber* files and flatCam projects, as well
as the resultant **gCode** used to produce the circuit boards

You *may* need to add **libraries/cnc3018_Library.lib** and/or **cnc3018-PCB.pretty**
to your kiCad installation in order to view or modify the kiCad files.


## Main Controller Board

I will admit up-front to the fact that I really only understand so much
about designing circuits and circuit boards.   This is the first board I
have created with kiCad and flatCam and there was a lot to learn in the
process.

[![Populated2.jpg](images/Populated2.jpg)](images/Populated2_large.jpg)

I have tried to put *filter capacitors* into the circuit appropriately,
particularly for the 74HC165 switch processing, but I think I am still
short some 100nf capacitors here and there.

Otherwise, it is a pretty straight forward Arduino-like circuit
with three **a4988** stepper controller boards.  You can determine
the pins that I am using for various things from the schematic, and/or
the C++ source code files.

[![_controller.jpg](kiCad/_controller.jpg)](kiCad/_controller.pdf)

You can click on the above image to get a PDF file of the schematic.

The extra jumpers in the diagram (labeled as "V#" for "via") are there
to provide the pcb design with "pads" that can be uncovered for "vias".
I could not figure out how to make kiCad include the "vias" in the
"pad" plot.

![_controller_pcb.jpg](kiCad/_controller_pcb.jpg)

You can see the ESP32 dev module I am using in other photographs.
It is the slightly smaller kind, with mounting holes.

[![Populated1.jpg](images/Populated1.jpg)](images/Populated1_large.jpg)


## LCD Connector

The LCD Connector just adds a few resistors and duplicates
the MISO/MOSI/CLK signals to the "touch" portion of the larger
TFT connector, winnowing the needed connections down to 8 pins
for the cable to the control board.

![lcd_connector.jpg](kiCad/lcd_connector.jpg)
![lcd_connector_pcb.jpg](kiCad/lcd_connector_pcb.jpg)

I soldered the 8 wires directly to the board and the other
end is a JST connector to the control board.

[![LcdConnector1.jpg](images/LcdConnector1.jpg)](images/LcdConnector1_large.jpg)
[![LcdConnector2.jpg](images/LcdConnector2.jpg)](images/LcdConnector2_large.jpg)

## Power Supply and Spindle Controller

The input power to the stepper and spindle motors is 24V.

[![power_spindle1.jpg](images/power_spindle1.jpg)](images/power_spindle1_large.jpg)
[![power_spindle2.jpg](images/power_spindle2.jpg)](images/power_spindle2_large.jpg)

This board implements the MOSFET PWM spindle motor controller
and also has an onboard 5V buck convertor to power the ESP32.

![spindle_power.jpg](kiCad/spindle_power.jpg)

I added some big (220uf and 300uf) capacitors to the board to
try to make it work better.  There is a jumper to disconnect
the buck power supply from the ESP32 as needed.

![spindle_power_pcb.jpg](kiCad/spindle_power_pcb.jpg)

It works ok, but is a hodgepodge, and needs further work.
When I get it *right* I will incorporate it directly onto
the controller board, but for now I prefer it as a separate
module that I can experiment with.


<br>
<hr>
<div style="text-align: right">
<a href='software.md'>NEXT</a><i> - the Software</i>
</div>