EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
Wire Wire Line
	3600 3350 3600 3450
Wire Wire Line
	3750 3650 3750 4050
Wire Wire Line
	4700 2950 4500 2950
Wire Wire Line
	4500 2950 4500 3850
Wire Wire Line
	4700 3550 4350 3550
Wire Wire Line
	4350 3550 4350 2950
Wire Wire Line
	4700 3150 4650 3150
Wire Wire Line
	4650 3150 4650 4050
Wire Wire Line
	4650 4050 4200 4050
Connection ~ 3600 3450
Wire Wire Line
	4700 3050 4050 3050
Wire Wire Line
	4050 3050 4050 3550
Wire Wire Line
	3900 3050 3900 3350
Wire Wire Line
	3900 3350 4700 3350
Wire Wire Line
	3800 3150 3800 2850
Connection ~ 3800 2850
Wire Wire Line
	3750 3150 3800 3150
Connection ~ 3750 4050
Wire Wire Line
	3800 2850 4700 2850
Wire Wire Line
	4700 3450 4250 3450
Wire Wire Line
	3600 3450 3600 3950
$Comp
L Device:R R2
U 1 1 6148DFD0
P 3600 3150
F 0 "R2" V 3550 2950 50  0000 C CNN
F 1 "10K" V 3600 3150 50  0000 C CNN
F 2 "cnc3018-PCB:myResistor" V 3530 3150 50  0001 C CNN
F 3 "~" H 3600 3150 50  0001 C CNN
	1    3600 3150
	0    1    1    0
$EndComp
Wire Wire Line
	3450 3550 3450 3750
Connection ~ 3450 3550
Wire Wire Line
	4050 3550 3950 3550
Wire Wire Line
	3450 3450 3450 3550
Wire Wire Line
	3000 2950 4350 2950
Wire Wire Line
	3000 3050 3900 3050
Wire Wire Line
	3000 3150 3450 3150
Wire Wire Line
	3000 3250 4700 3250
Wire Wire Line
	3000 3350 3600 3350
Wire Wire Line
	3000 3450 3450 3450
Wire Wire Line
	3000 3550 3100 3550
Wire Wire Line
	3100 3550 3100 2750
Wire Wire Line
	3000 3650 3750 3650
Wire Wire Line
	3000 3750 3450 3750
Wire Wire Line
	3000 3850 4500 3850
Wire Wire Line
	3000 3950 3600 3950
Wire Wire Line
	3000 4050 3750 4050
$Comp
L Device:R R1
U 1 1 6149A29E
P 3250 2750
F 0 "R1" V 3200 2550 50  0000 C CNN
F 1 "100" V 3250 2750 50  0000 C CNN
F 2 "cnc3018-PCB:myResistor" V 3180 2750 50  0001 C CNN
F 3 "~" H 3250 2750 50  0001 C CNN
	1    3250 2750
	0    1    1    0
$EndComp
NoConn ~ 3000 4150
$Comp
L cnc3018_Library:TFT_ILI9341 M1
U 1 1 6147A123
P 1950 3600
F 0 "M1" H 1417 2635 50  0000 C CNN
F 1 "TFT_ILI9341" H 1417 2726 50  0000 C CNN
F 2 "cnc3018-PCB:my14Pin" H 1450 3350 50  0001 C CNN
F 3 "" H 1450 3350 50  0001 C CNN
	1    1950 3600
	-1   0    0    1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 6147C8F0
P 4900 2850
F 0 "J1" H 5100 2850 50  0000 L CNN
F 1 "5V" H 5250 2850 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 2850 50  0001 C CNN
F 3 "~" H 4900 2850 50  0001 C CNN
	1    4900 2850
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 6147DA28
P 4900 2950
F 0 "J2" H 5100 2950 50  0000 L CNN
F 1 "T_CS" H 5250 2950 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 2950 50  0001 C CNN
F 3 "~" H 4900 2950 50  0001 C CNN
	1    4900 2950
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 6147E475
P 4900 3050
F 0 "J3" H 5100 3050 50  0000 L CNN
F 1 "CLK" H 5250 3050 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 3050 50  0001 C CNN
F 3 "~" H 4900 3050 50  0001 C CNN
	1    4900 3050
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 6147F1E3
P 4900 3150
F 0 "J4" H 5100 3150 50  0000 L CNN
F 1 "MISO" H 5250 3150 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 3150 50  0001 C CNN
F 3 "~" H 4900 3150 50  0001 C CNN
	1    4900 3150
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 6147FDC6
P 4900 3250
F 0 "J5" H 5100 3250 50  0000 L CNN
F 1 "DC" H 5250 3250 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 3250 50  0001 C CNN
F 3 "~" H 4900 3250 50  0001 C CNN
	1    4900 3250
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 61480747
P 4900 3350
F 0 "J6" H 5100 3350 50  0000 L CNN
F 1 "CS" H 5250 3350 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 3350 50  0001 C CNN
F 3 "~" H 4900 3350 50  0001 C CNN
	1    4900 3350
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 6148260B
P 4900 3450
F 0 "J7" H 5100 3450 50  0000 L CNN
F 1 "MOSI" H 5250 3450 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 3450 50  0001 C CNN
F 3 "~" H 4900 3450 50  0001 C CNN
	1    4900 3450
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 6148308A
P 4900 3550
F 0 "J8" H 5100 3550 50  0000 L CNN
F 1 "GND" H 5250 3550 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 4900 3550 50  0001 C CNN
F 3 "~" H 4900 3550 50  0001 C CNN
	1    4900 3550
	1    0    0    -1
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V7
U 1 1 614909A3
P 4150 3650
F 0 "V7" H 4230 3646 50  0000 L CNN
F 1 "Conn_01x01" H 4230 3601 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 4150 3650 50  0001 C CNN
F 3 "~" H 4150 3650 50  0001 C CNN
	1    4150 3650
	0    1    1    0
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V9
U 1 1 614913A4
P 4250 3650
F 0 "V9" H 4330 3646 50  0000 L CNN
F 1 "Conn_01x01" H 4330 3601 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 4250 3650 50  0001 C CNN
F 3 "~" H 4250 3650 50  0001 C CNN
	1    4250 3650
	0    1    1    0
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V6
U 1 1 61491E38
P 4100 4250
F 0 "V6" H 4180 4246 50  0000 L CNN
F 1 "Conn_01x01" H 4180 4201 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 4100 4250 50  0001 C CNN
F 3 "~" H 4100 4250 50  0001 C CNN
	1    4100 4250
	0    1    1    0
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V8
U 1 1 61492738
P 4200 4250
F 0 "V8" H 4280 4246 50  0000 L CNN
F 1 "Conn_01x01" H 4280 4201 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 4200 4250 50  0001 C CNN
F 3 "~" H 4200 4250 50  0001 C CNN
	1    4200 4250
	0    1    1    0
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V3
U 1 1 6149312E
P 3850 3750
F 0 "V3" H 3930 3746 50  0000 L CNN
F 1 "Conn_01x01" H 3930 3701 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 3850 3750 50  0001 C CNN
F 3 "~" H 3850 3750 50  0001 C CNN
	1    3850 3750
	0    1    1    0
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V5
U 1 1 61493B84
P 3950 3750
F 0 "V5" H 4030 3746 50  0000 L CNN
F 1 "Conn_01x01" H 4030 3701 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 3950 3750 50  0001 C CNN
F 3 "~" H 3950 3750 50  0001 C CNN
	1    3950 3750
	0    1    1    0
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V1
U 1 1 614948AC
P 3000 2400
F 0 "V1" H 3080 2396 50  0000 L CNN
F 1 "Conn_01x01" H 3080 2351 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 3000 2400 50  0001 C CNN
F 3 "~" H 3000 2400 50  0001 C CNN
	1    3000 2400
	0    -1   -1   0
$EndComp
$Comp
L Connector_Generic:Conn_01x01 V2
U 1 1 614953E0
P 3100 2400
F 0 "V2" H 3180 2396 50  0000 L CNN
F 1 "Conn_01x01" H 3180 2351 50  0001 L CNN
F 2 "cnc3018-PCB:my1pin" H 3100 2400 50  0001 C CNN
F 3 "~" H 3100 2400 50  0001 C CNN
	1    3100 2400
	0    -1   -1   0
$EndComp
Connection ~ 4150 3450
Wire Wire Line
	4150 3450 3600 3450
Connection ~ 4250 3450
Wire Wire Line
	4250 3450 4150 3450
Connection ~ 3950 3550
Wire Wire Line
	3950 3550 3850 3550
Connection ~ 3850 3550
Wire Wire Line
	3850 3550 3450 3550
Connection ~ 4100 4050
Wire Wire Line
	4100 4050 3750 4050
Connection ~ 4200 4050
Wire Wire Line
	4200 4050 4100 4050
Wire Wire Line
	3000 2850 3500 2850
Wire Wire Line
	3100 2750 3100 2600
Connection ~ 3100 2750
Wire Wire Line
	3100 2600 3000 2600
Connection ~ 3100 2600
Wire Wire Line
	3400 2750 3500 2750
Wire Wire Line
	3500 2750 3500 2850
Connection ~ 3500 2850
Wire Wire Line
	3500 2850 3800 2850
$EndSCHEMATC
