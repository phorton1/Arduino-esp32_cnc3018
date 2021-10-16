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
Text GLabel 2850 4250 0    50   Input ~ 0
SPIN-
Text GLabel 2850 3800 0    50   Input ~ 0
SPIN+
$Comp
L power:GND #PWR?
U 1 1 611BF7E2
P 5300 5850
F 0 "#PWR?" H 5300 5600 50  0001 C CNN
F 1 "GND" H 5305 5677 50  0000 C CNN
F 2 "" H 5300 5850 50  0001 C CNN
F 3 "" H 5300 5850 50  0001 C CNN
	1    5300 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR?
U 1 1 611BF7DC
P 3700 3300
F 0 "#PWR?" H 3700 3150 50  0001 C CNN
F 1 "+24V" H 3715 3473 50  0000 C CNN
F 2 "" H 3700 3300 50  0001 C CNN
F 3 "" H 3700 3300 50  0001 C CNN
	1    3700 3300
	1    0    0    -1  
$EndComp
Text Notes 5450 5000 0    50   ~ 0
60V Vdss\n12mO Rds\n50A Id
$Comp
L Transistor_FET:C3M0065090D Q?
U 1 1 611BE112
P 5200 4650
F 0 "Q?" H 5404 4696 50  0001 L CNN
F 1 "B50N6" H 5405 4650 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 5200 4650 50  0001 C CIN
F 3 "https://www.wolfspeed.com/media/downloads/176/C3M0065090D.pdf" H 5200 4650 50  0001 L CNN
	1    5200 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 6122C115
P 5950 4050
F 0 "R20" H 6020 4096 50  0000 L CNN
F 1 "4.7K" H 6020 4005 50  0000 L CNN
F 2 "" V 5880 4050 50  0001 C CNN
F 3 "~" H 5950 4050 50  0001 C CNN
	1    5950 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 6122C427
P 3700 4550
F 0 "R16" H 3770 4596 50  0000 L CNN
F 1 "1K" H 3770 4505 50  0000 L CNN
F 2 "" V 3630 4550 50  0001 C CNN
F 3 "~" H 3700 4550 50  0001 C CNN
	1    3700 4550
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-357T U?
U 1 1 6122CFFE
P 3800 5150
F 0 "U?" H 3800 5475 50  0001 C CNN
F 1 "LTV-357T" H 3800 5384 50  0000 C CNN
F 2 "Package_SO:SO-4_4.4x3.6mm_P2.54mm" H 3600 4950 50  0001 L CIN
F 3 "https://www.buerklin.com/medias/sys_master/download/download/h91/ha0/8892020588574.pdf" H 3800 5150 50  0001 L CNN
	1    3800 5150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R22
U 1 1 61230384
P 4600 4900
F 0 "R22" H 4670 4946 50  0000 L CNN
F 1 "10K" H 4670 4855 50  0000 L CNN
F 2 "" V 4530 4900 50  0001 C CNN
F 3 "~" H 4600 4900 50  0001 C CNN
	1    4600 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4650 4600 4650
Wire Wire Line
	4600 4750 4600 4650
Connection ~ 4600 4650
Wire Wire Line
	4600 4650 5000 4650
Wire Wire Line
	5300 4850 5300 5250
Wire Wire Line
	4600 5050 4600 5250
Wire Wire Line
	4600 5250 5300 5250
Text Notes 2600 5250 0    50   ~ 0
CTR : MIN. 50% at \nIF = 5mA, VCE = 5V
Connection ~ 3700 3800
Wire Wire Line
	3700 3300 3700 3800
$Comp
L Device:LED D7
U 1 1 612490AB
P 5650 4250
F 0 "D7" H 5643 4467 50  0000 C CNN
F 1 "LED" H 5643 4376 50  0000 C CNN
F 2 "" H 5650 4250 50  0001 C CNN
F 3 "~" H 5650 4250 50  0001 C CNN
	1    5650 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4250 5950 4250
Wire Wire Line
	5950 4250 5950 4200
Text Notes 4950 3650 2    50   ~ 0
Fast Recovery Diode\nForward Voltage  1.3v 2A\nReverse Recovery Time 500ns\nReverse Voltage 1kV
Wire Wire Line
	2850 3800 3700 3800
$Comp
L Device:D DS
U 1 1 6124DFEB
P 4800 4000
F 0 "DS" V 4754 4080 50  0000 L CNN
F 1 "RS 2M" V 4845 4080 50  0000 L CNN
F 2 "" H 4800 4000 50  0001 C CNN
F 3 "~" H 4800 4000 50  0001 C CNN
	1    4800 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 3800 3700 4400
Wire Wire Line
	3700 4700 3700 4850
Wire Wire Line
	3900 4650 3900 4850
Wire Wire Line
	5300 5250 5300 5850
Connection ~ 5300 5250
Wire Wire Line
	4800 3850 4800 3800
Connection ~ 4800 3800
Wire Wire Line
	4800 4150 4800 4250
Connection ~ 4800 4250
Wire Wire Line
	4800 4250 5300 4250
Wire Wire Line
	5950 3800 5950 3900
Wire Wire Line
	3700 3800 4800 3800
Wire Wire Line
	2850 4250 4800 4250
Wire Wire Line
	4800 3800 5950 3800
Wire Wire Line
	5300 4450 5300 4250
Connection ~ 5300 4250
Wire Wire Line
	5300 4250 5500 4250
$Comp
L Device:R R14
U 1 1 612641A4
P 3700 5900
F 0 "R14" H 3770 5946 50  0000 L CNN
F 1 "680" H 3770 5855 50  0000 L CNN
F 2 "" V 3630 5900 50  0001 C CNN
F 3 "~" H 3700 5900 50  0001 C CNN
	1    3700 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 6050 3700 6450
Text GLabel 3200 6450 0    50   Input ~ 0
PWM
Wire Wire Line
	3200 6450 3700 6450
Wire Wire Line
	3700 5450 3700 5750
Wire Wire Line
	3900 5450 3900 6700
Wire Wire Line
	3900 6700 3200 6700
Text GLabel 3200 6700 0    50   Input ~ 0
5V
$EndSCHEMATC
