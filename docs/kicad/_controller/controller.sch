EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 8500 11000 portrait
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R11
U 1 1 61502373
P 3550 6400
F 0 "R11" V 3620 6446 50  0001 C CNN
F 1 "10K" V 3600 6400 50  0000 C TNN
F 2 "cnc3018-PCB:myResistor" V 3480 6400 50  0001 C CNN
F 3 "~" H 3550 6400 50  0001 C CNN
	1    3550 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 1700 7200 1100
Wire Wire Line
	7000 1700 7000 1100
Wire Wire Line
	6900 1700 6900 1100
Wire Wire Line
	5750 1700 5750 1100
Wire Wire Line
	5650 1700 5650 1100
Wire Wire Line
	5550 1700 5550 1100
Wire Wire Line
	5450 1700 5450 1100
$Comp
L cnc3018_Library:SD_TYP0 M5
U 1 1 61159427
P 4000 6000
F 0 "M5" V 3800 6100 50  0000 L CNN
F 1 "SD_TYP0" H 3950 6150 50  0000 L CNN
F 2 "cnc3018-PCB:my6Pin" H 3800 6150 50  0001 C CNN
F 3 "" H 3800 6150 50  0001 C CNN
	1    4000 6000
	0    1    1    0   
$EndComp
NoConn ~ 4100 2400
Wire Wire Line
	6800 2400 6900 2400
$Comp
L cnc3018_Library:A498_Module M2
U 1 1 6115AF6A
P 5600 2050
F 0 "M2" H 5100 2050 50  0000 R CNN
F 1 "A4988" H 5700 2050 50  0000 R CNN
F 2 "cnc3018-PCB:a498" H 5600 2650 50  0001 C CNN
F 3 "" H 5600 2650 50  0001 C CNN
	1    5600 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 2400 5450 2400
NoConn ~ 7000 2400
NoConn ~ 5550 2400
Wire Wire Line
	7100 2400 7200 2400
Wire Wire Line
	5650 2400 5750 2400
$Comp
L Device:CP C1
U 1 1 61CA8339
P 3650 1650
F 0 "C1" V 3500 1500 50  0000 R CNN
F 1 "100uf" V 3500 1750 50  0000 R CNN
F 2 "cnc3018-PCB:my2pin" H 3688 1500 50  0001 C CNN
F 3 "~" H 3650 1650 50  0001 C CNN
	1    3650 1650
	0    1    1    0   
$EndComp
$Comp
L Device:CP C2
U 1 1 61CAB210
P 5100 1700
F 0 "C2" V 4950 1550 50  0000 R CNN
F 1 "100uf" V 4950 1800 50  0000 R CNN
F 2 "cnc3018-PCB:my2pin" H 5138 1550 50  0001 C CNN
F 3 "~" H 5100 1700 50  0001 C CNN
	1    5100 1700
	0    1    1    0   
$EndComp
$Comp
L Device:CP C3
U 1 1 61CBBEF5
P 6550 1700
F 0 "C3" V 6400 1550 50  0000 R CNN
F 1 "100uf" V 6400 1800 50  0000 R CNN
F 2 "cnc3018-PCB:my2pin" H 6588 1550 50  0001 C CNN
F 3 "~" H 6550 1700 50  0001 C CNN
	1    6550 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 1700 4300 1100
Wire Wire Line
	4200 1700 4200 1100
Wire Wire Line
	4100 1700 4100 1100
Wire Wire Line
	4000 1700 4000 1100
Wire Wire Line
	3800 1650 3800 1700
$Comp
L Connector_Generic:Conn_01x03 J23
U 1 1 61287997
P 1400 7750
F 0 "J23" H 1480 7792 50  0001 L CNN
F 1 "WS2812B Strip" H 1480 7746 50  0000 L CNN
F 2 "cnc3018-PCB:my3pin" H 1400 7750 50  0001 C CNN
F 3 "~" H 1400 7750 50  0001 C CNN
	1    1400 7750
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C5
U 1 1 621C27DF
P 2150 4100
F 0 "C5" V 2300 4050 50  0000 L CNN
F 1 "330uf 50v" V 2000 4000 50  0000 L CNN
F 2 "cnc3018-PCB:mySkip1" H 2188 3950 50  0001 C CNN
F 3 "~" H 2150 4100 50  0001 C CNN
	1    2150 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 2400 4300 2400
Wire Wire Line
	3900 2400 4000 2400
$Comp
L cnc3018_Library:A498_Module M1
U 1 1 6140FBFC
P 4150 2050
F 0 "M1" H 3650 2050 50  0000 R CNN
F 1 "A4988" H 4250 2050 50  0000 R CNN
F 2 "cnc3018-PCB:a498" H 4150 2650 50  0001 C CNN
F 3 "" H 4150 2650 50  0001 C CNN
	1    4150 2050
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 623F918D
P 2000 4100
F 0 "#PWR030" H 2000 3950 50  0001 C CNN
F 1 "+5V" V 2015 4228 50  0000 L CNN
F 2 "" H 2000 4100 50  0001 C CNN
F 3 "" H 2000 4100 50  0001 C CNN
	1    2000 4100
	0    -1   -1   0   
$EndComp
Text GLabel 3300 6100 0    50   Input ~ 0
MOSI
Text GLabel 3300 5900 0    50   Input ~ 0
MISO
Text GLabel 3300 6000 0    50   Input ~ 0
MCLK
Text GLabel 3300 6200 0    50   Input ~ 0
SD_CS
$Comp
L power:+3.3V #PWR038
U 1 1 624C5832
P 3300 6300
F 0 "#PWR038" H 3300 6150 50  0001 C CNN
F 1 "+3.3V" V 3300 6450 50  0000 L CNN
F 2 "" H 3300 6300 50  0001 C CNN
F 3 "" H 3300 6300 50  0001 C CNN
	1    3300 6300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR037
U 1 1 62518B20
P 3300 5800
F 0 "#PWR037" H 3300 5550 50  0001 C CNN
F 1 "GND" V 3300 5600 50  0000 C CNN
F 2 "" H 3300 5800 50  0001 C CNN
F 3 "" H 3300 5800 50  0001 C CNN
	1    3300 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 5800 3700 5800
Wire Wire Line
	3300 5900 3400 5900
Wire Wire Line
	3300 6000 3700 6000
Wire Wire Line
	3300 6100 3700 6100
Wire Wire Line
	3300 6200 3700 6200
Wire Wire Line
	3300 6300 3700 6300
Wire Wire Line
	3700 6300 3700 6400
Connection ~ 3700 6300
Wire Wire Line
	3400 6400 3400 5900
Connection ~ 3400 5900
Wire Wire Line
	3400 5900 3700 5900
Text GLabel 3950 7850 3    50   Input ~ 0
TOUCH_CS
Text GLabel 3650 7850 3    50   Input ~ 0
TFT_DC
Text GLabel 3550 7850 3    50   Input ~ 0
TFT_CS
$Comp
L power:+5V #PWR043
U 1 1 626715F3
P 4050 7850
F 0 "#PWR043" H 4050 7700 50  0001 C CNN
F 1 "+5V" V 4050 8050 50  0000 C CNN
F 2 "" H 4050 7850 50  0001 C CNN
F 3 "" H 4050 7850 50  0001 C CNN
	1    4050 7850
	-1   0    0    1   
$EndComp
Text GLabel 3750 7850 3    50   Input ~ 0
MISO
Text GLabel 3450 7850 3    50   Input ~ 0
MOSI
$Comp
L power:GND #PWR042
U 1 1 625FE7F4
P 3350 7850
F 0 "#PWR042" H 3350 7600 50  0001 C CNN
F 1 "GND" V 3350 7650 50  0000 C CNN
F 2 "" H 3350 7850 50  0001 C CNN
F 3 "" H 3350 7850 50  0001 C CNN
	1    3350 7850
	1    0    0    -1  
$EndComp
Text GLabel 3850 7850 3    50   Input ~ 0
MCLK
$Comp
L Connector_Generic:Conn_01x08 J22
U 1 1 612A4EF6
P 3650 7650
F 0 "J22" V 3614 7162 50  0001 R CNN
F 1 "Display" V 3800 7750 50  0000 R CNN
F 2 "cnc3018-PCB:my8Pin" H 3650 7650 50  0001 C CNN
F 3 "~" H 3650 7650 50  0001 C CNN
	1    3650 7650
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR041
U 1 1 627A22B7
P 1600 7850
F 0 "#PWR041" H 1600 7700 50  0001 C CNN
F 1 "+5V" V 1600 8050 50  0000 C CNN
F 2 "" H 1600 7850 50  0001 C CNN
F 3 "" H 1600 7850 50  0001 C CNN
	1    1600 7850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR040
U 1 1 627C5D8E
P 1600 7650
F 0 "#PWR040" H 1600 7400 50  0001 C CNN
F 1 "GND" V 1600 7450 50  0000 C CNN
F 2 "" H 1600 7650 50  0001 C CNN
F 3 "" H 1600 7650 50  0001 C CNN
	1    1600 7650
	0    -1   -1   0   
$EndComp
Text GLabel 1600 7750 2    50   Input ~ 0
LED
Text GLabel 4500 2400 3    50   Input ~ 0
X_DIR
Text GLabel 4400 2400 3    50   Input ~ 0
X_STEP
Text GLabel 7300 2400 3    50   Input ~ 0
Z_STEP
Text GLabel 7400 2400 3    50   Input ~ 0
Z_DIR
Text GLabel 5950 2400 3    50   Input ~ 0
Y_DIR
Text GLabel 5850 2400 3    50   Input ~ 0
Y_STEP
Text GLabel 3800 2400 3    50   Input ~ 0
STEP_EN
$Comp
L power:+3.3V #PWR018
U 1 1 6293CBD7
P 3900 2400
F 0 "#PWR018" H 3900 2250 50  0001 C CNN
F 1 "+3.3V" V 3900 2650 50  0000 C CNN
F 2 "" H 3900 2400 50  0001 C CNN
F 3 "" H 3900 2400 50  0001 C CNN
	1    3900 2400
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR020
U 1 1 62947D56
P 6800 2400
F 0 "#PWR020" H 6800 2250 50  0001 C CNN
F 1 "+3.3V" V 6800 2650 50  0000 C CNN
F 2 "" H 6800 2400 50  0001 C CNN
F 3 "" H 6800 2400 50  0001 C CNN
	1    6800 2400
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR019
U 1 1 62952439
P 5350 2400
F 0 "#PWR019" H 5350 2250 50  0001 C CNN
F 1 "+3.3V" V 5350 2650 50  0000 C CNN
F 2 "" H 5350 2400 50  0001 C CNN
F 3 "" H 5350 2400 50  0001 C CNN
	1    5350 2400
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 62979AB2
P 4400 1700
F 0 "#PWR06" H 4400 1550 50  0001 C CNN
F 1 "+3.3V" V 4400 1950 50  0000 C CNN
F 2 "" H 4400 1700 50  0001 C CNN
F 3 "" H 4400 1700 50  0001 C CNN
	1    4400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR010
U 1 1 62982DAF
P 5850 1700
F 0 "#PWR010" H 5850 1550 50  0001 C CNN
F 1 "+3.3V" V 5850 1950 50  0000 C CNN
F 2 "" H 5850 1700 50  0001 C CNN
F 3 "" H 5850 1700 50  0001 C CNN
	1    5850 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR014
U 1 1 6298C1AE
P 7300 1700
F 0 "#PWR014" H 7300 1550 50  0001 C CNN
F 1 "+3.3V" V 7300 1950 50  0000 C CNN
F 2 "" H 7300 1700 50  0001 C CNN
F 3 "" H 7300 1700 50  0001 C CNN
	1    7300 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6299B421
P 3900 1700
F 0 "#PWR05" H 3900 1450 50  0001 C CNN
F 1 "GND" V 3900 1500 50  0000 C CNN
F 2 "" H 3900 1700 50  0001 C CNN
F 3 "" H 3900 1700 50  0001 C CNN
	1    3900 1700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 629A4665
P 4500 1700
F 0 "#PWR07" H 4500 1450 50  0001 C CNN
F 1 "GND" V 4500 1500 50  0000 C CNN
F 2 "" H 4500 1700 50  0001 C CNN
F 3 "" H 4500 1700 50  0001 C CNN
	1    4500 1700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 629AD9B4
P 5350 1700
F 0 "#PWR09" H 5350 1450 50  0001 C CNN
F 1 "GND" V 5350 1500 50  0000 C CNN
F 2 "" H 5350 1700 50  0001 C CNN
F 3 "" H 5350 1700 50  0001 C CNN
	1    5350 1700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 629B6ED9
P 5950 1700
F 0 "#PWR011" H 5950 1450 50  0001 C CNN
F 1 "GND" V 5950 1500 50  0000 C CNN
F 2 "" H 5950 1700 50  0001 C CNN
F 3 "" H 5950 1700 50  0001 C CNN
	1    5950 1700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 629C0396
P 6800 1700
F 0 "#PWR013" H 6800 1450 50  0001 C CNN
F 1 "GND" V 6800 1500 50  0000 C CNN
F 2 "" H 6800 1700 50  0001 C CNN
F 3 "" H 6800 1700 50  0001 C CNN
	1    6800 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 1700 7100 1100
$Comp
L power:GND #PWR015
U 1 1 629C94C5
P 7400 1700
F 0 "#PWR015" H 7400 1450 50  0001 C CNN
F 1 "GND" V 7400 1500 50  0000 C CNN
F 2 "" H 7400 1700 50  0001 C CNN
F 3 "" H 7400 1700 50  0001 C CNN
	1    7400 1700
	-1   0    0    1   
$EndComp
$Comp
L cnc3018_Library:A498_Module M3
U 1 1 6115A4C4
P 7050 2050
F 0 "M3" H 6450 2050 50  0000 L CNN
F 1 "A4988" H 6950 2050 50  0000 L CNN
F 2 "cnc3018-PCB:a498" H 7050 2650 50  0001 C CNN
F 3 "" H 7050 2650 50  0001 C CNN
	1    7050 2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 629FBBCA
P 6400 1700
F 0 "#PWR012" H 6400 1450 50  0001 C CNN
F 1 "GND" V 6400 1500 50  0000 C CNN
F 2 "" H 6400 1700 50  0001 C CNN
F 3 "" H 6400 1700 50  0001 C CNN
	1    6400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 62A030A5
P 4950 1700
F 0 "#PWR08" H 4950 1450 50  0001 C CNN
F 1 "GND" V 4950 1500 50  0000 C CNN
F 2 "" H 4950 1700 50  0001 C CNN
F 3 "" H 4950 1700 50  0001 C CNN
	1    4950 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 62A0ABB2
P 3500 1650
F 0 "#PWR04" H 3500 1400 50  0001 C CNN
F 1 "GND" V 3500 1450 50  0000 C CNN
F 2 "" H 3500 1650 50  0001 C CNN
F 3 "" H 3500 1650 50  0001 C CNN
	1    3500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1500 6700 1700
Connection ~ 6700 1700
Wire Wire Line
	5250 1500 5250 1700
Connection ~ 5250 1700
Wire Wire Line
	3800 1500 3800 1650
Connection ~ 3800 1650
$Comp
L power:GND #PWR031
U 1 1 62AEC7E9
P 2300 4100
F 0 "#PWR031" H 2300 3850 50  0001 C CNN
F 1 "GND" V 2300 3900 50  0000 C CNN
F 2 "" H 2300 4100 50  0001 C CNN
F 3 "" H 2300 4100 50  0001 C CNN
	1    2300 4100
	0    -1   -1   0   
$EndComp
Connection ~ 3900 2400
Connection ~ 5350 2400
Connection ~ 6800 2400
$Comp
L cnc3018_Library:BUCK01 M4
U 1 1 62C77DBA
P 1300 4500
F 0 "M4" V 1229 4738 50  0000 L CNN
F 1 "BUCK01" V 1320 4738 50  0000 L CNN
F 2 "cnc3018-PCB:BUCK01" H 1250 4800 50  0001 C CNN
F 3 "" H 1250 4800 50  0001 C CNN
	1    1300 4500
	0    1    1    0   
$EndComp
$Comp
L power:+24V #PWR026
U 1 1 62C84B9D
P 2150 3300
F 0 "#PWR026" H 2150 3150 50  0001 C CNN
F 1 "+24V" V 2150 3550 50  0000 C CNN
F 2 "" H 2150 3300 50  0001 C CNN
F 3 "" H 2150 3300 50  0001 C CNN
	1    2150 3300
	0    1    1    0   
$EndComp
$Comp
L power:+24V #PWR028
U 1 1 62C9593E
P 1150 4100
F 0 "#PWR028" H 1150 3950 50  0001 C CNN
F 1 "+24V" H 1165 4273 50  0000 C CNN
F 2 "" H 1150 4100 50  0001 C CNN
F 3 "" H 1150 4100 50  0001 C CNN
	1    1150 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 3400 1750 3400
$Comp
L Connector:Jack-DC J11
U 1 1 62C7EAA4
P 1150 3500
F 0 "J11" H 1207 3825 50  0000 C CNN
F 1 "Jack-DC" H 1207 3734 50  0000 C CNN
F 2 "cnc3018-PCB:myBarrelJack" H 1200 3460 50  0001 C CNN
F 3 "~" H 1200 3460 50  0001 C CNN
	1    1150 3500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW1
U 1 1 62C7E486
P 1950 3400
F 0 "SW1" H 1950 3685 50  0000 C CNN
F 1 "POWER" H 1950 3594 50  0000 C CNN
F 2 "cnc3018-PCB:SW_DPDT_BLUE_LEVER" H 1950 3400 50  0001 C CNN
F 3 "~" H 1950 3400 50  0001 C CNN
	1    1950 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR01
U 1 1 62D0C428
P 3800 1500
F 0 "#PWR01" H 3800 1350 50  0001 C CNN
F 1 "+24V" V 3800 1750 50  0000 C CNN
F 2 "" H 3800 1500 50  0001 C CNN
F 3 "" H 3800 1500 50  0001 C CNN
	1    3800 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR02
U 1 1 62D11769
P 5250 1500
F 0 "#PWR02" H 5250 1350 50  0001 C CNN
F 1 "+24V" V 5250 1750 50  0000 C CNN
F 2 "" H 5250 1500 50  0001 C CNN
F 3 "" H 5250 1500 50  0001 C CNN
	1    5250 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR03
U 1 1 62D16DE9
P 6700 1500
F 0 "#PWR03" H 6700 1350 50  0001 C CNN
F 1 "+24V" V 6700 1750 50  0000 C CNN
F 2 "" H 6700 1500 50  0001 C CNN
F 3 "" H 6700 1500 50  0001 C CNN
	1    6700 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR035
U 1 1 62D3D592
P 1250 5200
F 0 "#PWR035" H 1250 5050 50  0001 C CNN
F 1 "+5V" V 1250 5400 50  0000 C CNN
F 2 "" H 1250 5200 50  0001 C CNN
F 3 "" H 1250 5200 50  0001 C CNN
	1    1250 5200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR029
U 1 1 62D464CA
P 1450 4100
F 0 "#PWR029" H 1450 3850 50  0001 C CNN
F 1 "GND" V 1450 3900 50  0000 C CNN
F 2 "" H 1450 4100 50  0001 C CNN
F 3 "" H 1450 4100 50  0001 C CNN
	1    1450 4100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 62D4B6CC
P 1450 4850
F 0 "#PWR036" H 1450 4600 50  0001 C CNN
F 1 "GND" V 1450 4650 50  0000 C CNN
F 2 "" H 1450 4850 50  0001 C CNN
F 3 "" H 1450 4850 50  0001 C CNN
	1    1450 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 62E4C93F
P 1450 3600
F 0 "#PWR027" H 1450 3350 50  0001 C CNN
F 1 "GND" V 1450 3400 50  0000 C CNN
F 2 "" H 1450 3600 50  0001 C CNN
F 3 "" H 1450 3600 50  0001 C CNN
	1    1450 3600
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 62E5BE8A
P 4100 900
F 0 "J1" V 4250 1100 50  0000 R CNN
F 1 "X_AXIS" V 4250 950 50  0000 R CNN
F 2 "cnc3018-PCB:my4pin" H 4100 900 50  0001 C CNN
F 3 "~" H 4100 900 50  0001 C CNN
	1    4100 900 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 62E6297B
P 5550 900
F 0 "J2" V 5700 1100 50  0000 R CNN
F 1 "Y_AXIS" V 5700 950 50  0000 R CNN
F 2 "cnc3018-PCB:my4pin" H 5550 900 50  0001 C CNN
F 3 "~" H 5550 900 50  0001 C CNN
	1    5550 900 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 62E6887F
P 7000 900
F 0 "J3" V 7150 1100 50  0000 R CNN
F 1 "Z_AXIS" V 7150 950 50  0000 R CNN
F 2 "cnc3018-PCB:my4pin" H 7000 900 50  0001 C CNN
F 3 "~" H 7000 900 50  0001 C CNN
	1    7000 900 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 62E98971
P 1000 2150
F 0 "J4" H 918 1825 50  0000 C CNN
F 1 "PWM_1A" H 918 1916 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 1000 2150 50  0001 C CNN
F 3 "~" H 1000 2150 50  0001 C CNN
	1    1000 2150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 62EC515C
P 1200 2150
F 0 "#PWR016" H 1200 1900 50  0001 C CNN
F 1 "GND" V 1200 1950 50  0000 C CNN
F 2 "" H 1200 2150 50  0001 C CNN
F 3 "" H 1200 2150 50  0001 C CNN
	1    1200 2150
	0    -1   -1   0   
$EndComp
Text GLabel 1200 2050 2    50   Input ~ 0
PWM_1
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 62ED2045
P 1750 2150
F 0 "J5" H 1668 1825 50  0000 C CNN
F 1 "PWM_1B" H 1668 1916 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 1750 2150 50  0001 C CNN
F 3 "~" H 1750 2150 50  0001 C CNN
	1    1750 2150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 62ED204B
P 1950 2150
F 0 "#PWR017" H 1950 1900 50  0001 C CNN
F 1 "GND" V 1950 1950 50  0000 C CNN
F 2 "" H 1950 2150 50  0001 C CNN
F 3 "" H 1950 2150 50  0001 C CNN
	1    1950 2150
	0    -1   -1   0   
$EndComp
Text GLabel 1950 2050 2    50   Input ~ 0
PWM_1
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 62ED9CCB
P 1000 2650
F 0 "J6" H 918 2325 50  0000 C CNN
F 1 "PWM_2A" H 918 2416 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 1000 2650 50  0001 C CNN
F 3 "~" H 1000 2650 50  0001 C CNN
	1    1000 2650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 62ED9CD1
P 1200 2650
F 0 "#PWR021" H 1200 2400 50  0001 C CNN
F 1 "GND" V 1200 2450 50  0000 C CNN
F 2 "" H 1200 2650 50  0001 C CNN
F 3 "" H 1200 2650 50  0001 C CNN
	1    1200 2650
	0    -1   -1   0   
$EndComp
Text GLabel 1200 2550 2    50   Input ~ 0
PWM_2
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 62ED9CD8
P 1750 2650
F 0 "J7" H 1668 2325 50  0000 C CNN
F 1 "PWM_2B" H 1668 2416 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 1750 2650 50  0001 C CNN
F 3 "~" H 1750 2650 50  0001 C CNN
	1    1750 2650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 62ED9CDE
P 1950 2650
F 0 "#PWR022" H 1950 2400 50  0001 C CNN
F 1 "GND" V 1950 2450 50  0000 C CNN
F 2 "" H 1950 2650 50  0001 C CNN
F 3 "" H 1950 2650 50  0001 C CNN
	1    1950 2650
	0    -1   -1   0   
$EndComp
Text GLabel 1950 2550 2    50   Input ~ 0
PWM_2
Wire Wire Line
	4900 6500 5050 6500
Wire Wire Line
	4900 6850 4900 6500
Text GLabel 5150 6500 3    50   Input ~ 0
SW_CLK
Text GLabel 5050 6500 3    50   Input ~ 0
SW_LATCH
Text GLabel 5750 4600 1    50   Input ~ 0
SW_DATA
Text GLabel 6700 2400 3    50   Input ~ 0
STEP_EN
Text GLabel 5250 2400 3    50   Input ~ 0
STEP_EN
Text GLabel 7400 2500 3    50   Input ~ 0
Z_DIR
$Comp
L Connector_Generic:Conn_01x02 J21
U 1 1 6141E036
P 7550 7150
F 0 "J21" H 7630 7142 50  0000 L CNN
F 1 "UNUSED" H 7630 7051 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 7150 50  0001 C CNN
F 3 "~" H 7550 7150 50  0001 C CNN
	1    7550 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR039
U 1 1 6260F958
P 4900 7250
F 0 "#PWR039" H 4900 7000 50  0001 C CNN
F 1 "GND" V 4900 7050 50  0000 C CNN
F 2 "" H 4900 7250 50  0001 C CNN
F 3 "" H 4900 7250 50  0001 C CNN
	1    4900 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 7250 6200 7250
Connection ~ 4900 7250
Wire Wire Line
	4900 7250 4900 7150
$Comp
L Device:C C13
U 1 1 61833AEA
P 4900 7000
F 0 "C13" H 4700 7100 50  0000 C CNN
F 1 "472nf" H 4700 7000 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 4938 6850 50  0001 C CNN
F 3 "~" H 4900 7000 50  0001 C CNN
	1    4900 7000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6200 7250 7350 7250
Connection ~ 6200 7250
Wire Wire Line
	5750 4600 5750 5750
Wire Wire Line
	6200 7050 6200 7250
Wire Wire Line
	7000 7150 7350 7150
Connection ~ 6200 7050
NoConn ~ 5650 6500
Wire Wire Line
	6400 7050 6200 7050
Wire Wire Line
	6700 7050 6700 7150
Wire Wire Line
	6200 6950 7350 6950
Wire Wire Line
	6400 6750 6200 6750
Wire Wire Line
	7000 6850 7350 6850
Wire Wire Line
	6700 6750 6700 6850
Wire Wire Line
	6200 6650 7350 6650
Wire Wire Line
	6400 6450 6200 6450
Wire Wire Line
	7000 6550 7350 6550
Wire Wire Line
	6700 6450 6700 6550
Wire Wire Line
	6200 6350 7350 6350
Wire Wire Line
	6400 6150 6200 6150
Wire Wire Line
	7000 6250 7350 6250
Wire Wire Line
	6700 6150 6700 6250
Wire Wire Line
	6200 5950 7350 5950
Wire Wire Line
	6400 5750 6200 5750
Wire Wire Line
	7000 5850 7350 5850
Wire Wire Line
	6700 5750 6700 5850
Wire Wire Line
	6200 5650 7350 5650
Wire Wire Line
	6400 5450 6200 5450
Wire Wire Line
	7000 5550 7350 5550
Wire Wire Line
	6700 5450 6700 5550
Wire Wire Line
	6200 5350 7350 5350
Wire Wire Line
	6400 5150 6200 5150
Wire Wire Line
	7000 5250 7350 5250
Wire Wire Line
	6700 5150 6700 5250
Wire Wire Line
	6200 5050 6200 4850
Connection ~ 6200 5050
Wire Wire Line
	6200 5050 7350 5050
Wire Wire Line
	6400 4850 6200 4850
$Comp
L Connector_Generic:Conn_01x02 J14
U 1 1 6141DFE0
P 7550 4950
F 0 "J14" H 7630 4942 50  0000 L CNN
F 1 "X_ZERO" H 7630 4851 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 4950 50  0001 C CNN
F 3 "~" H 7550 4950 50  0001 C CNN
	1    7550 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 4950 7350 4950
Wire Wire Line
	6700 4850 6700 4950
Connection ~ 6700 4850
$Comp
L Device:C C6
U 1 1 6141DFD7
P 6550 4850
F 0 "C6" V 6400 4850 50  0000 C CNN
F 1 "100nf" V 6500 4650 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 4700 50  0001 C CNN
F 3 "~" H 6550 4850 50  0001 C CNN
	1    6550 4850
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J17
U 1 1 6141DFD1
P 7550 5850
F 0 "J17" H 7630 5842 50  0000 L CNN
F 1 "Y_LIM" H 7630 5751 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 5850 50  0001 C CNN
F 3 "~" H 7550 5850 50  0001 C CNN
	1    7550 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J16
U 1 1 6141DFCB
P 7550 5550
F 0 "J16" H 7630 5542 50  0000 L CNN
F 1 "Y_ZERO" H 7630 5451 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 5550 50  0001 C CNN
F 3 "~" H 7550 5550 50  0001 C CNN
	1    7550 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J20
U 1 1 6141DFC5
P 7550 6850
F 0 "J20" H 7630 6842 50  0000 L CNN
F 1 "PROBE" H 7630 6751 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 6850 50  0001 C CNN
F 3 "~" H 7550 6850 50  0001 C CNN
	1    7550 6850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J19
U 1 1 6141DFBF
P 7550 6550
F 0 "J19" H 7630 6542 50  0000 L CNN
F 1 "Z_LIM" H 7630 6451 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 6550 50  0001 C CNN
F 3 "~" H 7550 6550 50  0001 C CNN
	1    7550 6550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J18
U 1 1 6141DFB9
P 7550 6250
F 0 "J18" H 7630 6242 50  0000 L CNN
F 1 "Z_ZERO" H 7630 6151 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 6250 50  0001 C CNN
F 3 "~" H 7550 6250 50  0001 C CNN
	1    7550 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 6141DFB3
P 7550 5250
F 0 "J15" H 7630 5242 50  0000 L CNN
F 1 "X_LIM" H 7630 5151 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 7550 5250 50  0001 C CNN
F 3 "~" H 7550 5250 50  0001 C CNN
	1    7550 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6141DFAD
P 6850 4850
F 0 "R1" V 6800 5100 50  0000 L CNN
F 1 "10K" V 6850 4850 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip2" V 6780 4850 50  0001 C CNN
F 3 "~" H 6850 4850 50  0001 C CNN
	1    6850 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 6141DFA7
P 6850 4950
F 0 "R2" V 6800 5200 50  0000 L CNN
F 1 "100" V 6850 4950 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip5" V 6780 4950 50  0001 C CNN
F 3 "~" H 6850 4950 50  0001 C CNN
	1    6850 4950
	0    1    1    0   
$EndComp
$Comp
L cnc3018_Library:74HC165 U2
U 1 1 6141DFA1
P 5350 6350
F 0 "U2" H 5250 6050 50  0000 L CNN
F 1 "74HC165" H 5150 6200 50  0000 L CNN
F 2 "cnc3018-PCB:myDip16" H 5300 6250 50  0001 C CNN
F 3 "" H 5300 6250 50  0001 C CNN
	1    5350 6350
	-1   0    0    1   
$EndComp
Connection ~ 6200 5150
Wire Wire Line
	6200 5150 6200 5050
Connection ~ 6200 5350
Wire Wire Line
	6200 5350 6200 5150
Connection ~ 6200 5450
Wire Wire Line
	6200 5450 6200 5350
Connection ~ 6200 5650
Wire Wire Line
	6200 5650 6200 5700
Connection ~ 6200 5750
Wire Wire Line
	6200 5750 6200 5950
Connection ~ 6200 5950
Wire Wire Line
	6200 5950 6200 6150
Connection ~ 6200 6150
Wire Wire Line
	6200 6150 6200 6350
Connection ~ 6200 6350
Connection ~ 6200 6450
Connection ~ 6200 6650
Wire Wire Line
	6200 6650 6200 6750
Connection ~ 6200 6750
Wire Wire Line
	6200 6750 6200 6950
Connection ~ 6200 6950
Wire Wire Line
	6200 6950 6200 7050
Wire Wire Line
	6200 5450 6200 5650
Wire Wire Line
	6200 6450 6200 6500
Wire Wire Line
	5900 5850 6700 5850
Wire Wire Line
	6000 6550 6700 6550
Wire Wire Line
	5900 6250 6700 6250
Wire Wire Line
	6200 6350 6200 6450
Wire Wire Line
	5150 5750 5150 5700
Wire Wire Line
	5150 5700 5650 5700
Wire Wire Line
	5650 5700 5650 5750
Wire Wire Line
	5650 5700 6200 5700
Connection ~ 5650 5700
Connection ~ 6200 5700
Wire Wire Line
	6200 5700 6200 5750
Wire Wire Line
	5750 6500 6200 6500
Connection ~ 6200 6500
Wire Wire Line
	6200 6500 6200 6650
Wire Wire Line
	5900 5850 5900 5600
Wire Wire Line
	5900 5600 5550 5600
Wire Wire Line
	5550 5600 5550 5750
Wire Wire Line
	5450 5750 5450 5500
Wire Wire Line
	5450 5500 6000 5500
Wire Wire Line
	6000 5500 6000 5550
Wire Wire Line
	6000 5550 6700 5550
Wire Wire Line
	6700 5250 5350 5250
Wire Wire Line
	5350 5250 5350 5750
Wire Wire Line
	6700 4950 5250 4950
Wire Wire Line
	5250 4950 5250 5750
Connection ~ 6700 4950
Wire Wire Line
	5900 6250 5900 6600
Wire Wire Line
	5900 6600 5550 6600
Wire Wire Line
	5550 6600 5550 6500
Wire Wire Line
	6000 6700 5450 6700
Wire Wire Line
	5450 6700 5450 6500
Wire Wire Line
	6000 6550 6000 6700
Wire Wire Line
	5350 6500 5350 6850
Wire Wire Line
	5350 6850 6700 6850
Wire Wire Line
	5250 6500 5250 7150
Wire Wire Line
	5250 7150 6700 7150
Wire Wire Line
	7000 4850 7050 4850
Wire Wire Line
	7050 4850 7050 5150
Wire Wire Line
	7050 5150 7000 5150
Wire Wire Line
	7050 5150 7050 5450
Wire Wire Line
	7050 5450 7000 5450
Connection ~ 7050 5150
Wire Wire Line
	7050 5450 7050 5750
Wire Wire Line
	7050 5750 7000 5750
Connection ~ 7050 5450
Wire Wire Line
	7050 5750 7050 6150
Wire Wire Line
	7050 6150 7000 6150
Connection ~ 7050 5750
Wire Wire Line
	7050 6150 7050 6450
Wire Wire Line
	7050 6450 7000 6450
Connection ~ 7050 6150
Wire Wire Line
	7050 6450 7050 6750
Wire Wire Line
	7050 6750 7000 6750
Connection ~ 7050 6450
Wire Wire Line
	7050 4700 7050 4850
Connection ~ 7050 4850
$Comp
L Device:R R3
U 1 1 6141DF4B
P 6850 5150
F 0 "R3" V 6800 5400 50  0000 L CNN
F 1 "10K" V 6850 5150 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip3" V 6780 5150 50  0001 C CNN
F 3 "~" H 6850 5150 50  0001 C CNN
	1    6850 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 6141DF45
P 6850 5250
F 0 "R4" V 6800 5500 50  0000 L CNN
F 1 "100" V 6850 5250 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip4" V 6780 5250 50  0001 C CNN
F 3 "~" H 6850 5250 50  0001 C CNN
	1    6850 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 6141DF3F
P 6850 5450
F 0 "R5" V 6800 5700 50  0000 L CNN
F 1 "10K" V 6850 5450 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip4" V 6780 5450 50  0001 C CNN
F 3 "~" H 6850 5450 50  0001 C CNN
	1    6850 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 6141DF39
P 6850 5550
F 0 "R6" V 6800 5800 50  0000 L CNN
F 1 "100" V 6850 5550 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip3" V 6780 5550 50  0001 C CNN
F 3 "~" H 6850 5550 50  0001 C CNN
	1    6850 5550
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 6141DF33
P 6850 5750
F 0 "R7" V 6800 6000 50  0000 L CNN
F 1 "10K" V 6850 5750 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip5" V 6780 5750 50  0001 C CNN
F 3 "~" H 6850 5750 50  0001 C CNN
	1    6850 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 6141DF2D
P 6850 5850
F 0 "R8" V 6800 6100 50  0000 L CNN
F 1 "100" V 6850 5850 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip2" V 6780 5850 50  0001 C CNN
F 3 "~" H 6850 5850 50  0001 C CNN
	1    6850 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 6141DF27
P 6850 6150
F 0 "R9" V 6800 6400 50  0000 L CNN
F 1 "10K" V 6850 6150 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip5" V 6780 6150 50  0001 C CNN
F 3 "~" H 6850 6150 50  0001 C CNN
	1    6850 6150
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 6141DF21
P 6850 6250
F 0 "R10" V 6800 6500 50  0000 L CNN
F 1 "100" V 6850 6250 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip2" V 6780 6250 50  0001 C CNN
F 3 "~" H 6850 6250 50  0001 C CNN
	1    6850 6250
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 6141DF1B
P 6850 6450
F 0 "R12" V 6800 6700 50  0000 L CNN
F 1 "10K" V 6850 6450 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip4" V 6780 6450 50  0001 C CNN
F 3 "~" H 6850 6450 50  0001 C CNN
	1    6850 6450
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 6141DF15
P 6850 6550
F 0 "R13" V 6800 6800 50  0000 L CNN
F 1 "100" V 6850 6550 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip3" V 6780 6550 50  0001 C CNN
F 3 "~" H 6850 6550 50  0001 C CNN
	1    6850 6550
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 6141DF0F
P 6850 6750
F 0 "R14" V 6800 7000 50  0000 L CNN
F 1 "10K" V 6850 6750 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip3" V 6780 6750 50  0001 C CNN
F 3 "~" H 6850 6750 50  0001 C CNN
	1    6850 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 6141DF09
P 6850 6850
F 0 "R15" V 6800 7100 50  0000 L CNN
F 1 "100" V 6850 6850 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip4" V 6780 6850 50  0001 C CNN
F 3 "~" H 6850 6850 50  0001 C CNN
	1    6850 6850
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 6141DF03
P 6850 7050
F 0 "R16" V 6800 7300 50  0000 L CNN
F 1 "10K" V 6850 7050 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip2" V 6780 7050 50  0001 C CNN
F 3 "~" H 6850 7050 50  0001 C CNN
	1    6850 7050
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 6141DEFD
P 6850 7150
F 0 "R17" V 6800 7400 50  0000 L CNN
F 1 "100" V 6850 7150 50  0000 C CNN
F 2 "cnc3018-PCB:mySkip5" V 6780 7150 50  0001 C CNN
F 3 "~" H 6850 7150 50  0001 C CNN
	1    6850 7150
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 7050 7050 7050
Wire Wire Line
	7050 7050 7050 6750
Connection ~ 7050 6750
$Comp
L Device:C C7
U 1 1 6141DEF4
P 6550 5150
F 0 "C7" V 6400 5150 50  0000 C CNN
F 1 "100nf" V 6500 4950 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 5000 50  0001 C CNN
F 3 "~" H 6550 5150 50  0001 C CNN
	1    6550 5150
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 6141DEEE
P 6550 5450
F 0 "C8" V 6400 5450 50  0000 C CNN
F 1 "100nf" V 6500 5250 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 5300 50  0001 C CNN
F 3 "~" H 6550 5450 50  0001 C CNN
	1    6550 5450
	0    1    1    0   
$EndComp
$Comp
L Device:C C9
U 1 1 6141DEE8
P 6550 5750
F 0 "C9" V 6400 5750 50  0000 C CNN
F 1 "100nf" V 6500 5550 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 5600 50  0001 C CNN
F 3 "~" H 6550 5750 50  0001 C CNN
	1    6550 5750
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 6141DEE2
P 6550 6150
F 0 "C10" V 6400 6150 50  0000 C CNN
F 1 "100nf" V 6500 5950 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 6000 50  0001 C CNN
F 3 "~" H 6550 6150 50  0001 C CNN
	1    6550 6150
	0    1    1    0   
$EndComp
$Comp
L Device:C C11
U 1 1 6141DEDC
P 6550 6450
F 0 "C11" V 6400 6450 50  0000 C CNN
F 1 "100nf" V 6500 6250 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 6300 50  0001 C CNN
F 3 "~" H 6550 6450 50  0001 C CNN
	1    6550 6450
	0    1    1    0   
$EndComp
$Comp
L Device:C C12
U 1 1 6141DED6
P 6550 6750
F 0 "C12" V 6400 6750 50  0000 C CNN
F 1 "100nf" V 6500 6550 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 6600 50  0001 C CNN
F 3 "~" H 6550 6750 50  0001 C CNN
	1    6550 6750
	0    1    1    0   
$EndComp
$Comp
L Device:C C14
U 1 1 6141DED0
P 6550 7050
F 0 "C14" V 6400 7050 50  0000 C CNN
F 1 "100nf" V 6500 6850 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 6588 6900 50  0001 C CNN
F 3 "~" H 6550 7050 50  0001 C CNN
	1    6550 7050
	0    1    1    0   
$EndComp
Connection ~ 6700 5150
Connection ~ 6700 5250
Connection ~ 6700 5450
Connection ~ 6700 5550
Connection ~ 6700 5750
Connection ~ 6700 5850
Connection ~ 6700 6150
Connection ~ 6700 6250
Connection ~ 6700 6450
Connection ~ 6700 6550
Connection ~ 6700 6750
Connection ~ 6700 6850
Connection ~ 6700 7050
Connection ~ 6700 7150
Wire Wire Line
	5050 4700 5050 5750
Wire Wire Line
	5050 4700 7050 4700
$Comp
L power:+3.3V #PWR034
U 1 1 62B79FA7
P 5050 4700
F 0 "#PWR034" H 5050 4550 50  0001 C CNN
F 1 "+3.3V" V 5050 4950 50  0000 C CNN
F 2 "" H 5050 4700 50  0001 C CNN
F 3 "" H 5050 4700 50  0001 C CNN
	1    5050 4700
	1    0    0    -1  
$EndComp
Connection ~ 5050 4700
Text GLabel 3300 3350 1    50   Input ~ 0
PWM_2
Text GLabel 3300 4350 3    50   Input ~ 0
PWM_1
Text GLabel 4300 3350 1    50   Input ~ 0
SW_DATA
Text GLabel 3500 4350 3    50   Input ~ 0
SW_CLK
Text GLabel 3600 4350 3    50   Input ~ 0
SW_LATCH
Wire Wire Line
	4700 3300 4700 3350
$Comp
L power:+3.3V #PWR023
U 1 1 62B63A6E
P 4700 3300
F 0 "#PWR023" H 4700 3150 50  0001 C CNN
F 1 "+3.3V" V 4700 3550 50  0000 C CNN
F 2 "" H 4700 3300 50  0001 C CNN
F 3 "" H 4700 3300 50  0001 C CNN
	1    4700 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 62AB8487
P 3100 3350
F 0 "#PWR025" H 3100 3100 50  0001 C CNN
F 1 "GND" V 3100 3150 50  0000 C CNN
F 2 "" H 3100 3350 50  0001 C CNN
F 3 "" H 3100 3350 50  0001 C CNN
	1    3100 3350
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR024
U 1 1 62AAA655
P 3000 3350
F 0 "#PWR024" H 3000 3200 50  0001 C CNN
F 1 "+5V" V 3000 3550 50  0000 C CNN
F 2 "" H 3000 3350 50  0001 C CNN
F 3 "" H 3000 3350 50  0001 C CNN
	1    3000 3350
	1    0    0    -1  
$EndComp
Text GLabel 3700 3350 1    50   Input ~ 0
STEP_EN
Text GLabel 3900 3350 1    50   Input ~ 0
Z_DIR
Text GLabel 3800 3350 1    50   Input ~ 0
Z_STEP
Text GLabel 3500 3350 1    50   Input ~ 0
Y_STEP
Text GLabel 3600 3350 1    50   Input ~ 0
Y_DIR
Text GLabel 3200 3350 1    50   Input ~ 0
X_STEP
Text GLabel 3800 4350 3    50   Input ~ 0
MCLK
Text GLabel 3700 4350 3    50   Input ~ 0
TOUCH_CS
Text GLabel 4000 4350 3    50   Input ~ 0
TFT_DC
Text GLabel 4300 4350 3    50   Input ~ 0
TFT_CS
Text GLabel 3900 4350 3    50   Input ~ 0
MISO
Text GLabel 4400 4350 3    50   Input ~ 0
MOSI
Text GLabel 3400 4350 3    50   Input ~ 0
SD_CS
$Comp
L power:GND #PWR033
U 1 1 624003E7
P 3100 4350
F 0 "#PWR033" H 3100 4100 50  0001 C CNN
F 1 "GND" V 3100 4150 50  0000 C CNN
F 2 "" H 3100 4350 50  0001 C CNN
F 3 "" H 3100 4350 50  0001 C CNN
	1    3100 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR032
U 1 1 623FFFB3
P 3000 4350
F 0 "#PWR032" H 3000 4200 50  0001 C CNN
F 1 "+3.3V" V 3000 4600 50  0000 C CNN
F 2 "" H 3000 4350 50  0001 C CNN
F 3 "" H 3000 4350 50  0001 C CNN
	1    3000 4350
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 613DE385
P 4200 3150
F 0 "J10" V 4164 3062 50  0001 R CNN
F 1 "bbb" H 4550 3150 50  0001 R CNN
F 2 "cnc3018-PCB:my1pin" H 4200 3150 50  0001 C CNN
F 3 "~" H 4200 3150 50  0001 C CNN
	1    4200 3150
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 613D5CC1
P 4100 3150
F 0 "J9" V 4064 3062 50  0001 R CNN
F 1 "bbb" H 4450 3150 50  0001 R CNN
F 2 "cnc3018-PCB:my1pin" H 4100 3150 50  0001 C CNN
F 3 "~" H 4100 3150 50  0001 C CNN
	1    4100 3150
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 613B4CC9
P 4000 3150
F 0 "J8" V 3964 3062 50  0001 R CNN
F 1 "bbb" H 4350 3150 50  0001 R CNN
F 2 "cnc3018-PCB:my1pin" H 4000 3150 50  0001 C CNN
F 3 "~" H 4000 3150 50  0001 C CNN
	1    4000 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C4
U 1 1 61697EE0
P 4550 3350
F 0 "C4" V 4295 3350 50  0001 C CNN
F 1 "10uF" V 4400 3300 50  0000 C CNN
F 2 "cnc3018-PCB:my2pin" H 4588 3200 50  0001 C CNN
F 3 "~" H 4550 3350 50  0001 C CNN
	1    4550 3350
	0    1    1    0   
$EndComp
$Comp
L cnc3018_Library:ESP32_DEV_0 U1
U 1 1 6120DB8C
P 3800 3900
F 0 "U1" H 4528 3996 50  0001 L CNN
F 1 "ESP32_DEV_0" H 4528 3950 50  0001 L CNN
F 2 "cnc3018-PCB:ESP32-DEV_0" H 3250 4000 50  0001 C CNN
F 3 "" H 3250 4000 50  0001 C CNN
	1    3800 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J24
U 1 1 63212548
P 1250 5400
F 0 "J24" V 1250 5100 50  0000 L CNN
F 1 "5V Jumper" V 1400 5250 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 1250 5400 50  0001 C CNN
F 3 "~" H 1250 5400 50  0001 C CNN
	1    1250 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 4850 1150 5100
NoConn ~ 4100 4350
NoConn ~ 4200 4350
Wire Wire Line
	1750 3400 1800 3600
Wire Wire Line
	1800 3600 2100 3600
Wire Wire Line
	2100 3600 2150 3500
Connection ~ 1750 3400
Text GLabel 3400 3350 1    50   Input ~ 0
X_DIR
Text GLabel 3200 4350 3    50   Input ~ 0
LED
$Comp
L Connector_Generic:Conn_01x01 J13
U 1 1 6333D6FD
P 850 3850
F 0 "J13" V 814 3762 50  0001 R CNN
F 1 "bbb" H 1200 3850 50  0001 R CNN
F 2 "cnc3018-PCB:my1pin" H 850 3850 50  0001 C CNN
F 3 "~" H 850 3850 50  0001 C CNN
	1    850  3850
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J12
U 1 1 633522C0
P 750 3850
F 0 "J12" V 714 3762 50  0001 R CNN
F 1 "bbb" H 1100 3850 50  0001 R CNN
F 2 "cnc3018-PCB:my1pin" H 750 3850 50  0001 C CNN
F 3 "~" H 750 3850 50  0001 C CNN
	1    750  3850
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J26
U 1 1 6339A2CE
P 900 4900
F 0 "J26" V 864 4812 50  0001 R CNN
F 1 "bbb" H 1250 4900 50  0001 R CNN
F 2 "cnc3018-PCB:my1pin" H 900 4900 50  0001 C CNN
F 3 "~" H 900 4900 50  0001 C CNN
	1    900  4900
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J25
U 1 1 6339A2D4
P 800 4900
F 0 "J25" V 764 4812 50  0001 R CNN
F 1 "bbb" H 1150 4900 50  0001 R CNN
F 2 "cnc3018-PCB:my1pin" H 800 4900 50  0001 C CNN
F 3 "~" H 800 4900 50  0001 C CNN
	1    800  4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	900  5100 1150 5100
Connection ~ 1150 5100
Wire Wire Line
	1150 5100 1150 5200
$Comp
L power:GND #PWR0101
U 1 1 633B23E3
P 750 4050
F 0 "#PWR0101" H 750 3800 50  0001 C CNN
F 1 "GND" V 750 3850 50  0000 C CNN
F 2 "" H 750 4050 50  0001 C CNN
F 3 "" H 750 4050 50  0001 C CNN
	1    750  4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 633B7F89
P 800 5100
F 0 "#PWR0102" H 800 4850 50  0001 C CNN
F 1 "GND" V 800 4900 50  0000 C CNN
F 2 "" H 800 5100 50  0001 C CNN
F 3 "" H 800 5100 50  0001 C CNN
	1    800  5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  4050 850  4100
Wire Wire Line
	850  4100 1150 4100
Connection ~ 1150 4100
$Comp
L Device:CP C15
U 1 1 633D0320
P 2150 4850
F 0 "C15" V 2300 4800 50  0000 L CNN
F 1 "220uf 10V" V 2000 4750 50  0000 L CNN
F 2 "cnc3018-PCB:my2pin" H 2188 4700 50  0001 C CNN
F 3 "~" H 2150 4850 50  0001 C CNN
	1    2150 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR045
U 1 1 633D032C
P 2300 4850
F 0 "#PWR045" H 2300 4600 50  0001 C CNN
F 1 "GND" V 2300 4650 50  0000 C CNN
F 2 "" H 2300 4850 50  0001 C CNN
F 3 "" H 2300 4850 50  0001 C CNN
	1    2300 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR044
U 1 1 633E30A3
P 2000 4850
F 0 "#PWR044" H 2000 4700 50  0001 C CNN
F 1 "+3.3V" V 2000 5100 50  0000 C CNN
F 2 "" H 2000 4850 50  0001 C CNN
F 3 "" H 2000 4850 50  0001 C CNN
	1    2000 4850
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
