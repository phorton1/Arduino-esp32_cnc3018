## Immediate Commands Supported by Esp32_Grbl

- **Ctrl-X 0x18** - Reset
- **'?'** - StatusReport
- **'~'** - CycleStart
- **'!'** - FeedHold
- **0x84** - SafetyDoor
- **0x85** - JogCancel
- **0x86** - DebugReport               // Only when DEBUG_REPORT_REALTIME enabled, sends debug report in '{}' braces.
- **0x90** - FeedOvrReset              // Restores feed override value to 100%.
- **0x91** - FeedOvrCoarsePlus
- **0x92** - FeedOvrCoarseMinus
- **0x93** - FeedOvrFinePlus
- **0x94** - FeedOvrFineMinus
- **0x95** - RapidOvrReset             // Restores rapid override value to 100%.
- **0x96** - RapidOvrMedium
- **0x97** - RapidOvrLow
- **0x98** - RapidOvrExtraLow          // *NOT SUPPORTED*
- **0x99** - SpindleOvrReset           // Restores spindle override value to 100%.
- **0x9A** - SpindleOvrCoarsePlus      // 154
- **0x9B** - SpindleOvrCoarseMinus
- **0x9C** - SpindleOvrFinePlus
- **0x9D** - SpindleOvrFineMinus
- **0x9E** - SpindleOvrStop
- **0xA0** - CoolantFloodOvrToggle
- **0xA1** - CoolantMistOvrToggle

### added realtime commands to set various values

- '_' - Start Realtime Value Stream

At this time the only value stored is the realtime Z offset
which is merely AVAILABLE for derived machines to use

_-0.100z


## GCodes supported by Esp32_Grbl

- MG1 **G0** - Move
- MG1 **G1** - Move Feed Rate
- MG1 **G2** - Clockwise Move Arc Feed Rate
- MG1 **G3** - Counterclockwise Move Arc Feed Rate
- MG2 **G17** - Plane Selection XY (default)
- MG2 **G18** - Plane Selection ZX
- MG2 **G19** - Plane Selection YZ
- MG6 **G20** - Units in Inches
- MG6 **G21** - Units in Millimeters
- MG1 **G38.1** - Probe Contact Toward workpiece SignalError=Yes
- MG1 **G38.2** - Probe Contact Toward workpiece SignalError=No
- MG1 **G38.3** - Probe No Contact Away from workpiece [SignalError=Yes]
- MG1 **G38.4** - Probe No Contact Away from workpiece [SignalError=No] - appears to
  be implemented smae as G38.3 in FluidNC
- MG7 **G40** - Cutter Radius Compensation Off (compensation itself is not supported)
- MG8 **G43** - Tool Length Offset
- MG8 **G43.1** - Tool Length Offset
- MG8 **G49** - Tool Length Offset
- MG12 **G54-G59** - Select Coordinate System (1-6) (G59.x are not supported)
- MG13 **G61** - Exact Path Mode
- MG1 **G80** - Cancel Modal Motion (for unsupported canned cycles)
- MG3 **G90** - Absolute Move Mode
- MG3 **G91** - Relative Move Mode
- MG3 **G91.1** - Arc Distance Relative MoveMode
- MG5 **G93** - Inverse Time Feed Mode: F word means the move should be completed in
   [one divided by the F number] minutes. For example, if the F number is 2.0,
   the move should be completed in half a minute
- MG5 **G94** - Units per Minute Feed Mode

- MM4 **M0** - Pause "Program"
- MM4 **M1** - Pause "Program"  but only if the optional stop switch is on
- MM4 **M2** - End "Program"
- MM7 **M3** - Spindle CW
- MM7 **M4** - Spindle CCW
- MM7 **M5** - Spindle Stop
- MM6 **M6 Tn** - Tool Change
- MM7 **M7** - Mist Coolant ON
- MM7 **M8** - Flood Coolant ON
- MM7 **M9** - All Coolant Off
- MM4 **M30** - "To exchange pallet shuttles and then end a program"
- MM9 **M56** - Override::ParkingMotion (if enableParkingOverrideControl)
- MM10 **M62 P0-3** - Motion Synchronized (queued) Digtal Output ON
- MM10 **M63 P0-3** - Motion Synchronized (queued) Digtal Output OFF
- MM10 **M64 P0-3** - Immediate Output ON
- MM10 **M65 P0-3** - Immediate Output OFF
- MM10 **M67 E0-3 Qnnn** - Motion Synchronized (queued) Analog Output
- MM10 **M68 E0-3 Qnnn*** - Immediate Analog Output

### Notes

- Probe result values are available in global variables or via Serial Report
  but *not* via the documented #5070 etc "parameters" as # parameters are
  not supported in FluidNC.

- Coolant M7 and M8 may be active at same time*


### Non Modal Gcodes

- **G4 P[seconds]** - Dwell
- **G10 L2 Pn Xx Yy Zz** - Set coordinate system absolute
  where 'n' is the coordinate system 1..6 corresponding
  to G54..G59
  - G59.x and [R] not supported in FluidNC
- **G10 L20 Pn Xx Yy Zz** - Set coordinate system "such that'
  x,y,z becomes the current position
  - G59.x and [R] not supported in FluidNC
- **G28, G30** - Go to Predefined Position
- **G28.1, G30.1** - Store Predefined Position
- **G53** - Move in Absolute Coordinates
- **G92** - Set Coordinate System Offset "such that" you are at the given position
- **G92.1** - Clear Coordinate System Offset

