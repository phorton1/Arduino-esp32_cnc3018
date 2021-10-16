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
L cnc3018_Library:BUCK01 M1
U 1 1 6126666F
P 4400 5400
F 0 "M1" V 4329 5638 50  0001 L CNN
F 1 "BUCK01" V 4375 5638 50  0000 L CNN
F 2 "cnc3018-PCB:BUCK01" H 4350 5700 50  0001 C CNN
F 3 "" H 4350 5700 50  0001 C CNN
	1    4400 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J17
U 1 1 61268C01
P 5900 5450
F 0 "J17" H 5950 5550 50  0000 R CNN
F 1 "OUT-" H 6250 5450 50  0000 R CNN
F 2 "cnc3018-PCB:my1pin" H 5900 5450 50  0001 C CNN
F 3 "~" H 5900 5450 50  0001 C CNN
	1    5900 5450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J18
U 1 1 61268C07
P 5900 5550
F 0 "J18" H 5950 5450 50  0000 R CNN
F 1 "OUT+" H 6250 5550 50  0000 R CNN
F 2 "cnc3018-PCB:my1pin" H 5900 5550 50  0001 C CNN
F 3 "~" H 5900 5550 50  0001 C CNN
	1    5900 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J16
U 1 1 614F64EB
P 5550 5750
F 0 "J16" V 5550 5900 50  0000 R CNN
F 1 "JMP2" H 5800 5750 50  0000 R CNN
F 2 "cnc3018-PCB:my1pin" H 5550 5750 50  0001 C CNN
F 3 "~" H 5550 5750 50  0001 C CNN
	1    5550 5750
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J15
U 1 1 614F64F1
P 5450 5750
F 0 "J15" V 5450 5650 50  0000 R CNN
F 1 "JMP1" H 5700 5750 50  0000 R CNN
F 2 "cnc3018-PCB:my1pin" H 5450 5750 50  0001 C CNN
F 3 "~" H 5450 5750 50  0001 C CNN
	1    5450 5750
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J19
U 1 1 6150CB76
P 6350 5250
F 0 "J19" V 6350 5150 50  0000 R CNN
F 1 "PWM" V 6450 5350 50  0000 R CNN
F 2 "cnc3018-PCB:my1pin" H 6350 5250 50  0001 C CNN
F 3 "~" H 6350 5250 50  0001 C CNN
	1    6350 5250
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J13
U 1 1 6159DA90
P 5200 4650
F 0 "J13" H 5350 4650 50  0000 R CNN
F 1 "SPWM" H 5450 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 5200 4650 50  0001 C CNN
F 3 "~" H 5200 4650 50  0001 C CNN
	1    5200 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 5050 5200 5050
Wire Wire Line
	5200 5050 5200 4850
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 61565C06
P 3350 4650
F 0 "J2" H 3500 4650 50  0000 R CNN
F 1 "24V-" H 3600 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 3350 4650 50  0001 C CNN
F 3 "~" H 3350 4650 50  0001 C CNN
	1    3350 4650
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 61565C0C
P 3450 4650
F 0 "J3" H 3600 4650 50  0000 R CNN
F 1 "24V+" H 3700 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 3450 4650 50  0001 C CNN
F 3 "~" H 3450 4650 50  0001 C CNN
	1    3450 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 5250 4750 5250
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 6159C2FC
P 3700 4650
F 0 "J4" H 3850 4650 50  0000 R CNN
F 1 "SP_BOARD-" H 3950 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 3700 4650 50  0001 C CNN
F 3 "~" H 3700 4650 50  0001 C CNN
	1    3700 4650
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 6159C302
P 3800 4650
F 0 "J5" H 3950 4650 50  0000 R CNN
F 1 "SP_BOARD+" H 4050 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 3800 4650 50  0001 C CNN
F 3 "~" H 3800 4650 50  0001 C CNN
	1    3800 4650
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J12
U 1 1 6159DA8A
P 5100 4650
F 0 "J12" H 5250 4650 50  0000 R CNN
F 1 "SPWM_GND" H 5350 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 5100 4650 50  0001 C CNN
F 3 "~" H 5100 4650 50  0001 C CNN
	1    5100 4650
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 615C1639
P 5000 4650
F 0 "J11" H 5150 4650 50  0000 R CNN
F 1 "SPWM_GND" H 5250 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 5000 4650 50  0001 C CNN
F 3 "~" H 5000 4650 50  0001 C CNN
	1    5000 4650
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J14
U 1 1 615C18E7
P 5300 4650
F 0 "J14" H 5450 4650 50  0000 R CNN
F 1 "SPWM" H 5550 4650 50  0000 L CNN
F 2 "cnc3018-PCB:my1pin" H 5300 4650 50  0001 C CNN
F 3 "~" H 5300 4650 50  0001 C CNN
	1    5300 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 5200 4000 5250
Connection ~ 4000 5250
Connection ~ 4750 5250
Wire Wire Line
	5000 4850 5100 4850
Wire Wire Line
	5100 4850 5100 5250
Connection ~ 5100 4850
Connection ~ 5100 5250
Wire Wire Line
	3700 4850 3700 5200
Connection ~ 3700 5200
Wire Wire Line
	3700 5200 4000 5200
Wire Wire Line
	3350 4850 3350 5200
Wire Wire Line
	3350 5200 3700 5200
Wire Wire Line
	3800 4850 3800 5550
Connection ~ 3800 5550
Wire Wire Line
	3800 5550 4000 5550
Wire Wire Line
	3450 4850 3450 5550
Wire Wire Line
	3450 5550 3800 5550
Wire Wire Line
	5700 5250 5700 5450
Wire Wire Line
	5100 5250 5700 5250
Wire Wire Line
	4750 5550 5450 5550
Wire Wire Line
	5550 5550 5700 5550
Wire Wire Line
	5300 4850 5200 4850
Connection ~ 5200 4850
Wire Wire Line
	4750 5250 5100 5250
Connection ~ 3450 5550
$Comp
L Connector:Jack-DC J1
U 1 1 615A9026
P 2400 5450
F 0 "J1" H 2457 5775 50  0000 C CNN
F 1 "Jack-DC" H 2457 5684 50  0000 C CNN
F 2 "cnc3018-PCB:myBarrelJack" H 2450 5410 50  0001 C CNN
F 3 "~" H 2450 5410 50  0001 C CNN
	1    2400 5450
	1    0    0    1   
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 61347CC2
P 3050 5550
F 0 "SW1" H 3050 5785 50  0001 C CNN
F 1 "ON_OFF" H 3050 5350 50  0000 C CNN
F 2 "cnc3018-PCB:my3pin" H 3050 5550 50  0001 C CNN
F 3 "~" H 3050 5550 50  0001 C CNN
	1    3050 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 5550 3450 5550
Wire Wire Line
	3350 5200 2700 5200
Wire Wire Line
	2700 5200 2700 5350
Connection ~ 3350 5200
Wire Wire Line
	2700 5550 2850 5550
$EndSCHEMATC
