# Yet another cnc3018 Grbl Controller with WiFi and a TFT touch UI

This project has been interesting and is a waypoint on my path of understanding
and developing CNC machine controllers.  It is difficult to explain the decision
making process that led me here, or why I think it has been worth the investment
of time to arrive at this point, but I will try to touch on the main points.

Let's just start by saying I had *CNC fever*.  It started with *robots* but then
I had some stepper motors sitting around, and I wanted to make *something*, so
I built the **vMachine**.  While I was doing that I ordered a bunch of stuff to
make a variety of machines, including ordering two copies of the cheapest chinese 3018 CNC
machines I could find.

I had already long ago decided that I was going to use the ESP32 and (at that
time) the Grbl_Esp32 codebase for my machines.   The lure of a $5 dual processor
240Mhz SBC with Wifi and BT is just too much!   No way was I gonna use the Arduino
based controller that came with the machines.  So I was thinking about that the
entire time I was developing the vMachine.

Grbl_Esp32 was subsequently renamed to FluidNC, and I subsequently forked and
modified it to be usable as an extensible Arduino library. I had already also
started TFT UI development, and so these diverse aspects came together during
this project.

For me, one of the most interesting things about this project is the fact that
I used a prototype (breadboard) circuit while developing the machine to **mill
a controller board** for the machine itself!

Today I am just writing a quick readme to show off some of the machine's features
and steps in it's development.


## Prototype Circuit

![01-ProtoTypeCircuit.jpg](images/01-ProtoTypeCircuit.jpg)

I use these cool breadboards from [5e Board](https://www.5eboard.com/product-category/5e-circuit-boards/)
that allow me to create more complex and secure prototypes than with a normal breadboard.
Even then I decided early on that the spindle motor control and power supply should be on
a separate board, so I designed and implemented those parts on perf board.  They are visible
in the above photo.

The "test leads" in the above photo are for the z-axis **probe** which plays into the
development of the machine itself as the probe is used to develop the **mesh** for leveling
which is needed to obtain the z accuracy to mill the PC board.

## Limit Switches

The very first thing that everyone does to stock 3018's is adds limit switches.
So I 3D printed some mounts and stuck some limit switches on the machine. For
X and Y I just use the most ubiquitously available (cheapest!) switches, though
a bit large.  I went through multiple iterations on the Z axis, starting with
micro switches, but then relenting to using small (more expensive) lever switches.

[![zAxisSwitch2.jpg](images/zAxisSwitch2.jpg)](images/zAzisSwitch2_large.jpg)
[![02-zAzisSwitch.jpg](images/02-zAzisSwitch.jpg)](images/02-zAzisSwitch_large.jpg)

Everything in grey plastic is my 3D printed additions to the machine (the black
plasatic is the original stuff).  The zAxis has a housing around the switches,
and an adjustable offset at the bottom (limit).  All the wires are shielded.

For the X and Y axis I originally started by using crimp on connectors that were
exposed, but didn't like them.  They kept falling off and the connectors were
too large for the wire I was using, so I 3D printed and constsructed my own connectors
using some thin brass sheet I've had sitting around for 20 years,

[![03-xyLimitSwitchConnector1.jpg](images/03-xyLimitSwitchConnector1.jpg)](images/03-xyLimitSwitchConnector1_large.jpg)
[![04-xyLimitSwitchConnector2.jpg](images/04-xyLimitSwitchConnector2.jpg)](images/04-xyLimitSwitchConnector2_large.jpg)

The crimp connectors were loose and easily fell off if you bumped them.
These connectors are secured with screws to ensure they don't fall off!

## Initial Sensor Board

I found pretty quickly that even with the nice breadboards, I was having
problems with the switches becasuse the leads on the resistors are small
and don't make good contact with breadboards.  So I created a perf board
version with the 74HC165 IO multiplexer chip and plugged it into the
breadboard:

[![SensorPerfBoard.jpg](images/SensorPerfBoard.jpg)](images/SensorPerfBoard_large.jpg)

## Milling the Controller Board

So, generally I got it working, but I was really anxious to eliminate the breadboard
and put a soldered board in place.   I was still getting problems due to the breadboard
and bad connections.

I had to learn a lot.  Spent time in  KiCad and Flatcam.   Designed it 10 times lol.
Cut some prototypes.  Learned a bit about applying and using green UV Solder Resist
Epoxy.


Finally got to where the following sequences of images looks practical :-)

1 - mill the board

[![MillingBoard1.jpg](images/MillingBoard1.jpg)](images/MillingBoard1_large.jpg)
[![MillingBoard2.jpg](images/MillingBoard2.jpg)](images/MillingBoard2_large.jpg)

In the end I had a pretty nice circuit board.  I will drill the holes after
doing the epoxy, so I then painted it with the green epoxy and exposed it
to the sun to cure the epoxy.

[![MilledBoard.jpg](images/MilledBoard.jpg)](images/MilledBoard_large.jpg)


2 - mill the epoxy

OK, so I won't do this again!   It worked on this (v04) board, but subsquently
proved way too touchy to try to mill the UV epoxy off.  The copper layer is only
35/1000's of a millimeter ... like 2/1000's of an inch ... thick.   Even though
I added **mesh levelling** to the project, it is still nearly impossible to get
accurate enough to mill off the epoxy and NOT destroy the copper pads underneath.

[![MillEpoxy2.jpg](images/MillEpoxy2.jpg)](images/MillEpoxy2_large.jpg)
[![MillEpoxy.jpg](images/MillEpoxy.jpg)](images/MillEpoxy_large.jpg)

The second photo above is actually a failure on an attempt to mill v05.
Most of the pads were destroyed because I was off by 1/100th of a millimeter!
Nonetheless it worked for this (V04) board and in the end I decided to use
V04 and move on.

I have ordered a UV laser.  My next idea is to expose the UV epoxy with the UV
laser on the cnc machine.  Photo masks are a bit complicated to work with!


3 - populate the board

Then it was pretty easy to solder on the headers, components, etc, and
I had a populated board.  It worked pretty much the first time!

[![Populated1.jpg](images/Populated1.jpg)](images/Populated1_large.jpg)
[![Populated2.jpg](images/Populated2.jpg)](images/Populated2_large.jpg)

I took a moment to take a photo of it with a light behind because it looks neat!

[![Transparent.jpg](images/Transparent.jpg)](images/Transparent_large.jpg)



## Adding the touch screen


I put the board in the machine, and then used the machine to cut
another small circuit board to be used as a connector for the touch
screen:

[![LcdConnector1.jpg](images/LcdConnector1.jpg)](images/LcdConnector1_large.jpg)
[![LcdConnector2.jpg](images/LcdConnector2.jpg)](images/LcdConnector2_large.jpg)

After 3D printing an enclosure for it, and attaching it to the machine
(and reprinting it to add 5 ws2812b LEDs) I decided to write this page

[![LcdEnclosure.jpg](images/LcdEnclosure.jpg)](images/LcdEnclosure_large.jpg)
[![LcdAttached.jpg](images/LcdAttached.jpg)](images/LcdAttached_large.jpg)

Here is the final machine:

[![Machine1.jpg](images/Machine1.jpg)](images/Machine1_large.jpg)

LOL, it still has the copper board from which I milled the LCD connector
on the work surface :-)