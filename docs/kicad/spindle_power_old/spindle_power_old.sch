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
L Switch:SW_SPST SW1
U 1 1 61347CC2
P 3700 5800
F 0 "SW1" H 3700 6035 50  0001 C CNN
F 1 "ON_OFF" H 3700 5943 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 3700 5800 50  0001 C CNN
F 3 "~" H 3700 5800 50  0001 C CNN
	1    3700 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 3700 3750 3700
$Comp
L Device:R R2
U 1 1 612B1C11
P 4300 3850
F 0 "R2" V 4093 3850 50  0001 C CNN
F 1 "10K" V 4185 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 4230 3850 50  0001 C CNN
F 3 "~" H 4300 3850 50  0001 C CNN
	1    4300 3850
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N5819 D1
U 1 1 61231E8E
P 3600 3700
F 0 "D1" V 3554 3780 50  0001 L CNN
F 1 "1N5819" H 3850 3700 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 3600 3525 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 3600 3700 50  0001 C CNN
	1    3600 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 3700 4200 3700
Wire Wire Line
	4300 4000 4000 4000
$Comp
L Transistor_FET:IRF540N Q1
U 1 1 61225117
P 4000 3800
F 0 "Q1" H 4204 3846 50  0001 L CNN
F 1 "IRF540N" V 4250 3650 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4250 3725 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 4000 3800 50  0001 L CNN
	1    4000 3800
	0    -1   -1   0   
$EndComp
$Comp
L Isolator:4N35 U3
U 1 1 61231182
P 3750 4350
F 0 "U3" H 3750 4675 50  0001 C CNN
F 1 "4N35" H 3750 4583 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 3550 4150 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 3750 4350 50  0001 L CNN
	1    3750 4350
	0    1    -1   0   
$EndComp
Wire Wire Line
	4000 4000 3750 4000
Wire Wire Line
	3750 4000 3750 4050
Connection ~ 4000 4000
Wire Wire Line
	3650 4050 3450 4050
Wire Wire Line
	3450 4050 3450 3900
Connection ~ 3450 4050
Wire Wire Line
	4600 3700 4300 3700
Connection ~ 4300 3700
Wire Wire Line
	3700 6000 3700 6050
Wire Wire Line
	3650 4650 3450 4650
Wire Wire Line
	3450 4050 3450 4650
Wire Wire Line
	4600 3700 4600 4950
Connection ~ 3450 4650
Wire Wire Line
	3450 3700 3450 3500
Connection ~ 3450 3700
Connection ~ 3750 3700
Wire Wire Line
	3750 3700 3750 3500
Wire Wire Line
	3750 3500 3550 3500
$Comp
L cnc3018_Library:BUCK01 M1
U 1 1 6126666F
P 4400 6000
F 0 "M1" V 4329 6238 50  0001 L CNN
F 1 "BUCK01" V 4375 6238 50  0000 L CNN
F 2 "cnc3018-PCB:BUCK01" H 4350 6300 50  0001 C CNN
F 3 "" H 4350 6300 50  0001 C CNN
	1    4400 6000
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 61268C01
P 5000 6450
F 0 "J5" H 5050 6550 50  0000 R CNN
F 1 "OUT-" H 5350 6450 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 5000 6450 50  0001 C CNN
F 3 "~" H 5000 6450 50  0001 C CNN
	1    5000 6450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 61268C07
P 5000 6550
F 0 "J6" H 5050 6450 50  0000 R CNN
F 1 "OUT+" H 5350 6550 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 5000 6550 50  0001 C CNN
F 3 "~" H 5000 6550 50  0001 C CNN
	1    5000 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6350 4250 6550
Wire Wire Line
	4550 6350 4550 6450
Wire Wire Line
	4550 6450 4800 6450
Wire Wire Line
	4550 5600 4550 5400
Wire Wire Line
	4550 5400 4250 5400
Wire Wire Line
	3450 4650 3450 5400
Connection ~ 3450 5400
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 61229043
P 3550 3300
F 0 "J3" V 3550 3200 50  0000 R CNN
F 1 "SPIN+" H 3900 3300 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 3550 3300 50  0001 C CNN
F 3 "~" H 3550 3300 50  0001 C CNN
	1    3550 3300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 61227F86
P 3450 3300
F 0 "J2" V 3450 3450 50  0000 R CNN
F 1 "SPIN-" H 3800 3300 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 3450 3300 50  0001 C CNN
F 3 "~" H 3450 3300 50  0001 C CNN
	1    3450 3300
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 6127AEC8
P 2700 3350
F 0 "J7" H 2300 3350 50  0000 R CNN
F 1 "NC" H 2450 3350 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2700 3350 50  0001 C CNN
F 3 "~" H 2700 3350 50  0001 C CNN
	1    2700 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 6127BED6
P 2700 3450
F 0 "J8" H 2300 3450 50  0000 R CNN
F 1 "NC" H 2450 3450 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2700 3450 50  0001 C CNN
F 3 "~" H 2700 3450 50  0001 C CNN
	1    2700 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 6127C480
P 2700 3550
F 0 "J9" H 2300 3550 50  0000 R CNN
F 1 "NC" H 2450 3550 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2700 3550 50  0001 C CNN
F 3 "~" H 2700 3550 50  0001 C CNN
	1    2700 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J12
U 1 1 6127D562
P 2750 6450
F 0 "J12" H 2350 6450 50  0000 R CNN
F 1 "NC" H 2500 6450 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2750 6450 50  0001 C CNN
F 3 "~" H 2750 6450 50  0001 C CNN
	1    2750 6450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J13
U 1 1 6127DAB4
P 2750 6550
F 0 "J13" H 2350 6550 50  0000 R CNN
F 1 "NC" H 2500 6550 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2750 6550 50  0001 C CNN
F 3 "~" H 2750 6550 50  0001 C CNN
	1    2750 6550
	1    0    0    -1  
$EndComp
NoConn ~ 2500 3350
NoConn ~ 2500 3450
NoConn ~ 2500 3550
NoConn ~ 2550 6250
NoConn ~ 2550 6350
NoConn ~ 2550 6450
NoConn ~ 2550 6550
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 6127CAE8
P 2750 6250
F 0 "J10" H 2350 6250 50  0000 R CNN
F 1 "NC" H 2500 6250 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2750 6250 50  0001 C CNN
F 3 "~" H 2750 6250 50  0001 C CNN
	1    2750 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 6127D0E7
P 2750 6350
F 0 "J11" H 2350 6350 50  0000 R CNN
F 1 "NC" H 2500 6350 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2750 6350 50  0001 C CNN
F 3 "~" H 2750 6350 50  0001 C CNN
	1    2750 6350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J14
U 1 1 6128D06F
P 3450 6250
F 0 "J14" V 3450 6150 50  0000 R CNN
F 1 "PWR-" V 3550 6350 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 3450 6250 50  0001 C CNN
F 3 "~" H 3450 6250 50  0001 C CNN
	1    3450 6250
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 6050 3450 5800
$Comp
L Connector_Generic:Conn_01x01 J15
U 1 1 6128F610
P 3700 6250
F 0 "J15" V 3700 6450 50  0000 R CNN
F 1 "PWR+" V 3800 6400 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 3700 6250 50  0001 C CNN
F 3 "~" H 3700 6250 50  0001 C CNN
	1    3700 6250
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J18
U 1 1 61299072
P 2950 5250
F 0 "J18" V 3150 5300 50  0000 R CNN
F 1 "24V+" V 3050 5350 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2950 5250 50  0001 C CNN
F 3 "~" H 2950 5250 50  0001 C CNN
	1    2950 5250
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J17
U 1 1 6129BF55
P 2700 5250
F 0 "J17" V 2900 5300 50  0000 R CNN
F 1 "24V+" V 2800 5350 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2700 5250 50  0001 C CNN
F 3 "~" H 2700 5250 50  0001 C CNN
	1    2700 5250
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J16
U 1 1 6129C637
P 2450 5250
F 0 "J16" V 2650 5300 50  0000 R CNN
F 1 "24V-" V 2550 5350 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2450 5250 50  0001 C CNN
F 3 "~" H 2450 5250 50  0001 C CNN
	1    2450 5250
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 6129CA98
P 2250 5250
F 0 "J1" V 2450 5300 50  0000 R CNN
F 1 "24V-" V 2350 5350 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 2250 5250 50  0001 C CNN
F 3 "~" H 2250 5250 50  0001 C CNN
	1    2250 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 5450 2450 5450
Wire Wire Line
	2450 5450 2450 5800
Wire Wire Line
	2450 5800 3450 5800
Connection ~ 2450 5450
Connection ~ 3450 5800
Wire Wire Line
	3450 5800 3450 5400
Wire Wire Line
	3700 5600 2950 5600
Wire Wire Line
	2950 5600 2950 5450
Connection ~ 3700 5600
Wire Wire Line
	2950 5450 2700 5450
Connection ~ 2950 5450
$Comp
L Device:CP C1
U 1 1 614E543D
P 3600 3900
F 0 "C1" V 3550 4150 50  0000 C CNN
F 1 "220uf" V 3600 3550 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 3638 3750 50  0001 C CNN
F 3 "~" H 3600 3900 50  0001 C CNN
	1    3600 3900
	0    1    1    0   
$EndComp
Connection ~ 3450 3900
Wire Wire Line
	3450 3900 3450 3700
Wire Wire Line
	3750 3700 3750 3900
$Comp
L Device:CP C2
U 1 1 614F166B
P 4250 5150
F 0 "C2" H 4368 5196 50  0000 L CNN
F 1 "330uf" H 4368 5105 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 4288 5000 50  0001 C CNN
F 3 "~" H 4250 5150 50  0001 C CNN
	1    4250 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5300 4250 5400
Connection ~ 4250 5400
Wire Wire Line
	4250 5400 3450 5400
$Comp
L Connector_Generic:Conn_01x01 J20
U 1 1 614F64EB
P 4550 6750
F 0 "J20" V 4550 6900 50  0000 R CNN
F 1 "NC" H 4750 6750 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4550 6750 50  0001 C CNN
F 3 "~" H 4550 6750 50  0001 C CNN
	1    4550 6750
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J19
U 1 1 614F64F1
P 4450 6750
F 0 "J19" V 4450 6650 50  0000 R CNN
F 1 "NC" H 4650 6750 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4450 6750 50  0001 C CNN
F 3 "~" H 4450 6750 50  0001 C CNN
	1    4450 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 6550 4450 6550
Wire Wire Line
	4550 6550 4800 6550
$Comp
L Device:R R1
U 1 1 612B27E8
P 4850 5100
F 0 "R1" V 4643 5100 50  0001 C CNN
F 1 "220" V 4735 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 4780 5100 50  0001 C CNN
F 3 "~" H 4850 5100 50  0001 C CNN
	1    4850 5100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J22
U 1 1 6150CB76
P 4850 5450
F 0 "J22" V 4850 5350 50  0000 R CNN
F 1 "SPWM" V 4950 5550 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4850 5450 50  0001 C CNN
F 3 "~" H 4850 5450 50  0001 C CNN
	1    4850 5450
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J21
U 1 1 61522223
P 4850 4750
F 0 "J21" V 4850 4650 50  0000 R CNN
F 1 "V1" V 4950 4750 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4850 4750 50  0001 C CNN
F 3 "~" H 4850 4750 50  0001 C CNN
	1    4850 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3700 5600 4000 5600
Wire Wire Line
	4000 5600 4250 5600
Connection ~ 4000 5600
Wire Wire Line
	4000 5600 4000 4950
Wire Wire Line
	4000 4950 4250 4950
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 6126BCB7
P 4350 4750
F 0 "J4" V 4350 4650 50  0000 R CNN
F 1 "V0" V 4450 4750 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4350 4750 50  0001 C CNN
F 3 "~" H 4350 4750 50  0001 C CNN
	1    4350 4750
	1    0    0    -1  
$EndComp
Connection ~ 4250 4950
Wire Wire Line
	4250 4950 4600 4950
Wire Wire Line
	4250 5000 4250 4950
Wire Wire Line
	3850 4750 4150 4750
Wire Wire Line
	3850 4650 3850 4750
Connection ~ 4150 4750
Wire Wire Line
	4150 4750 4850 4750
Wire Wire Line
	4850 4750 4850 4950
Connection ~ 4850 4950
$EndSCHEMATC
