; LightBurn 1.2.01
; GRBL device profile, absolute coords
; Bounds: X125 Y0.04 to X131 Y37.5
G00 G17 G40 G21 G54
G90
M4
; Cut @ 100 mm/min, 97% power
M8
G0 X125Y0.041
; Layer top Pass 1 of 2
G1 Y37.5S970F100
G1 X131
G1 Y0.041
; Layer top Pass 2 of 2
G1 Y37.5
G1 X125
G1 Y0.041
M9
G1 S0
M5
G90
; return to user-defined finish pos
G0 X0 Y0
M2
