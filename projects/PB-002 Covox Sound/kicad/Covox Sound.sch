EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:trs_3.5mm
LIBS:rc1_backplane
LIBS:mounting
LIBS:Covox Sound-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
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
Text Notes 12175 10925 0    60   ~ 0
Covox Sound Board
$Comp
L VCC #PWR01
U 1 1 5D63F697
P 14825 7525
F 0 "#PWR01" H 14825 7375 50  0001 C CNN
F 1 "VCC" H 14825 7675 50  0000 C CNN
F 2 "" H 14825 7525 50  0001 C CNN
F 3 "" H 14825 7525 50  0001 C CNN
	1    14825 7525
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5D63F634
P 14825 7775
F 0 "#PWR02" H 14825 7525 50  0001 C CNN
F 1 "GND" H 14825 7625 50  0000 C CNN
F 2 "" H 14825 7775 50  0001 C CNN
F 3 "" H 14825 7775 50  0001 C CNN
	1    14825 7775
	1    0    0    -1  
$EndComp
Text Notes 15400 11075 0    60   ~ 0
A
$Comp
L RC1_Backplane J4
U 1 1 5DC149FA
P 15150 7400
F 0 "J4" H 15150 9400 50  0000 C CNN
F 1 "Signals" V 15600 7350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x39_Pitch2.54mm" H 15150 7400 50  0001 C CNN
F 3 "" H 15150 7400 50  0001 C CNN
	1    15150 7400
	1    0    0    1   
$EndComp
Wire Wire Line
	14825 7700 14825 7775
$Comp
L C_Small C2
U 1 1 5DD0E0B6
P 5075 3000
F 0 "C2" H 5085 3070 50  0000 L CNN
F 1 "100nF" H 5085 2920 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 5075 3000 50  0001 C CNN
F 3 "" H 5075 3000 50  0001 C CNN
	1    5075 3000
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C1
U 1 1 5DD0E10C
P 4575 3300
F 0 "C1" H 4585 3370 50  0000 L CNN
F 1 "10nF" H 4585 3220 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 4575 3300 50  0001 C CNN
F 3 "" H 4575 3300 50  0001 C CNN
	1    4575 3300
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x10 J1
U 1 1 5DE736F3
P 2350 3700
F 0 "J1" H 2350 4200 50  0000 C CNN
F 1 "Port A" H 2350 3100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 2350 3700 50  0001 C CNN
F 3 "" H 2350 3700 50  0001 C CNN
	1    2350 3700
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x10 J3
U 1 1 5DE7382E
P 9100 3550
F 0 "J3" H 9100 4050 50  0000 C CNN
F 1 "Port B" H 9100 2950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 9100 3550 50  0001 C CNN
F 3 "" H 9100 3550 50  0001 C CNN
	1    9100 3550
	-1   0    0    -1  
$EndComp
Text Label 2775 4100 2    60   ~ 0
PA0
Text Label 2775 4000 2    60   ~ 0
PA1
Text Label 2775 3900 2    60   ~ 0
PA2
Text Label 2775 3800 2    60   ~ 0
PA3
Text Label 2775 3700 2    60   ~ 0
PA4
Text Label 2775 3600 2    60   ~ 0
PA5
Text Label 2775 3500 2    60   ~ 0
PA6
Text Label 2775 3400 2    60   ~ 0
PA7
Text Label 9525 3150 2    60   ~ 0
PB0
Text Label 9525 3250 2    60   ~ 0
PB1
Text Label 9525 3450 2    60   ~ 0
PB3
Text Label 9525 3550 2    60   ~ 0
PB4
Text Label 9525 3650 2    60   ~ 0
PB5
Text Label 9525 3750 2    60   ~ 0
PB6
Text Label 9525 3850 2    60   ~ 0
PB7
Text Label 9525 3350 2    60   ~ 0
PB2
NoConn ~ 2550 3300
NoConn ~ 2550 3200
NoConn ~ 9300 3950
NoConn ~ 9300 4050
NoConn ~ 14950 5500
NoConn ~ 14950 5600
NoConn ~ 14950 5700
NoConn ~ 14950 5800
NoConn ~ 14950 5900
NoConn ~ 14950 6000
NoConn ~ 14950 6100
NoConn ~ 14950 6200
NoConn ~ 14950 6300
NoConn ~ 14950 6400
NoConn ~ 14950 6500
NoConn ~ 14950 6600
NoConn ~ 14950 6700
NoConn ~ 14950 6800
NoConn ~ 14950 6900
NoConn ~ 14950 7000
NoConn ~ 14950 7100
NoConn ~ 14950 7200
NoConn ~ 14950 7300
NoConn ~ 14950 7400
NoConn ~ 14950 7500
NoConn ~ 14950 7800
NoConn ~ 14950 7900
NoConn ~ 14950 8000
NoConn ~ 14950 8100
NoConn ~ 14950 8200
NoConn ~ 14950 8300
NoConn ~ 14950 8400
NoConn ~ 14950 8500
NoConn ~ 14950 8600
NoConn ~ 14950 8700
NoConn ~ 14950 8800
NoConn ~ 14950 8900
NoConn ~ 14950 9000
NoConn ~ 14950 9100
NoConn ~ 14950 9200
NoConn ~ 14950 9300
Wire Wire Line
	14825 7600 14825 7525
Wire Wire Line
	14825 7600 14950 7600
Wire Wire Line
	14950 7700 14825 7700
Connection ~ 10250 3250
Connection ~ 9975 3150
Wire Wire Line
	10250 3075 10250 4025
Wire Wire Line
	9975 3075 9975 4025
Wire Wire Line
	10250 2700 10250 2775
Wire Wire Line
	9975 2700 11900 2700
Wire Wire Line
	9975 2625 9975 2775
$Comp
L VCC #PWR03
U 1 1 5DFFD76E
P 9975 2625
F 0 "#PWR03" H 9975 2475 50  0001 C CNN
F 1 "VCC" H 9975 2775 50  0000 C CNN
F 2 "" H 9975 2625 50  0001 C CNN
F 3 "" H 9975 2625 50  0001 C CNN
	1    9975 2625
	1    0    0    -1  
$EndComp
$Comp
L R R19
U 1 1 5DFFD73D
P 10250 2925
F 0 "R19" V 10330 2925 50  0001 C CNN
F 1 "1k" V 10250 2925 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10180 2925 50  0001 C CNN
F 3 "" H 10250 2925 50  0001 C CNN
	1    10250 2925
	-1   0    0    1   
$EndComp
$Comp
L R R18
U 1 1 5DFFD627
P 9975 2925
F 0 "R18" V 10055 2925 50  0001 C CNN
F 1 "1k" V 9975 2925 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9905 2925 50  0001 C CNN
F 3 "" H 9975 2925 50  0001 C CNN
	1    9975 2925
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR04
U 1 1 5DFFD477
P 11900 4575
F 0 "#PWR04" H 11900 4325 50  0001 C CNN
F 1 "GND" H 11900 4425 50  0000 C CNN
F 2 "" H 11900 4575 50  0001 C CNN
F 3 "" H 11900 4575 50  0001 C CNN
	1    11900 4575
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 4500 10250 4425
Wire Wire Line
	9975 4500 11900 4500
Wire Wire Line
	9975 4425 9975 4500
$Comp
L SW_Push SW2
U 1 1 5DFFD118
P 10250 4225
F 0 "SW2" H 10300 4325 50  0000 L CNN
F 1 "SW_Push" H 10250 4165 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 10250 4425 50  0001 C CNN
F 3 "" H 10250 4425 50  0001 C CNN
	1    10250 4225
	0    1    1    0   
$EndComp
$Comp
L SW_Push SW1
U 1 1 5DFFCFD9
P 9975 4225
F 0 "SW1" H 10025 4325 50  0000 L CNN
F 1 "SW_Push" H 9975 4165 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 9975 4425 50  0001 C CNN
F 3 "" H 9975 4425 50  0001 C CNN
	1    9975 4225
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 3150 9975 3150
Wire Wire Line
	9300 3250 10250 3250
Wire Wire Line
	9300 3350 10525 3350
Wire Wire Line
	9300 3450 10800 3450
Wire Wire Line
	9300 3550 11075 3550
Wire Wire Line
	9300 3650 11350 3650
Wire Wire Line
	9300 3750 11625 3750
Wire Wire Line
	9300 3850 11900 3850
$Comp
L R R8
U 1 1 5E08DC7C
P 3375 4050
F 0 "R8" V 3455 4050 50  0001 C CNN
F 1 "15k" V 3375 4050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 4050 50  0001 C CNN
F 3 "" H 3375 4050 50  0001 C CNN
	1    3375 4050
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 5E08DDD8
P 3375 3900
F 0 "R7" V 3455 3900 50  0001 C CNN
F 1 "15k" V 3375 3900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 3900 50  0001 C CNN
F 3 "" H 3375 3900 50  0001 C CNN
	1    3375 3900
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 5E08DDF8
P 3375 3750
F 0 "R6" V 3455 3750 50  0001 C CNN
F 1 "15k" V 3375 3750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 3750 50  0001 C CNN
F 3 "" H 3375 3750 50  0001 C CNN
	1    3375 3750
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 5E08DE18
P 3375 3600
F 0 "R5" V 3455 3600 50  0001 C CNN
F 1 "15k" V 3375 3600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 3600 50  0001 C CNN
F 3 "" H 3375 3600 50  0001 C CNN
	1    3375 3600
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 5E08DE38
P 3375 3450
F 0 "R4" V 3455 3450 50  0001 C CNN
F 1 "15k" V 3375 3450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 3450 50  0001 C CNN
F 3 "" H 3375 3450 50  0001 C CNN
	1    3375 3450
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 5E08DE58
P 3375 3300
F 0 "R3" V 3455 3300 50  0001 C CNN
F 1 "15k" V 3375 3300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 3300 50  0001 C CNN
F 3 "" H 3375 3300 50  0001 C CNN
	1    3375 3300
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 5E08DE78
P 3375 3150
F 0 "R2" V 3455 3150 50  0001 C CNN
F 1 "15k" V 3375 3150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 3150 50  0001 C CNN
F 3 "" H 3375 3150 50  0001 C CNN
	1    3375 3150
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5E08DE98
P 3375 3000
F 0 "R1" V 3455 3000 50  0001 C CNN
F 1 "15k" V 3375 3000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 3000 50  0001 C CNN
F 3 "" H 3375 3000 50  0001 C CNN
	1    3375 3000
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 5E08E138
P 3375 4200
F 0 "R9" V 3455 4200 50  0001 C CNN
F 1 "15k" V 3375 4200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3305 4200 50  0001 C CNN
F 3 "" H 3375 4200 50  0001 C CNN
	1    3375 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3225 4200 3150 4200
Wire Wire Line
	3150 4200 3150 4275
$Comp
L GND #PWR05
U 1 1 5E08E2E5
P 3150 4275
F 0 "#PWR05" H 3150 4025 50  0001 C CNN
F 1 "GND" H 3150 4125 50  0000 C CNN
F 2 "" H 3150 4275 50  0001 C CNN
F 3 "" H 3150 4275 50  0001 C CNN
	1    3150 4275
	1    0    0    -1  
$EndComp
Wire Wire Line
	2975 3400 2550 3400
$Comp
L R R10
U 1 1 5E08E6B3
P 3875 3000
F 0 "R10" V 3955 3000 50  0001 C CNN
F 1 "7k5" V 3875 3000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 3000 50  0001 C CNN
F 3 "" H 3875 3000 50  0001 C CNN
	1    3875 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3525 3000 3725 3000
$Comp
L R R11
U 1 1 5E08E82E
P 3875 3150
F 0 "R11" V 3955 3150 50  0001 C CNN
F 1 "7k5" V 3875 3150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 3150 50  0001 C CNN
F 3 "" H 3875 3150 50  0001 C CNN
	1    3875 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3625 3000 3625 3075
Wire Wire Line
	3625 3075 4100 3075
Wire Wire Line
	4100 3075 4100 3150
Wire Wire Line
	4100 3150 4025 3150
Connection ~ 3625 3000
Wire Wire Line
	3525 3150 3725 3150
$Comp
L R R12
U 1 1 5E08E980
P 3875 3300
F 0 "R12" V 3955 3300 50  0001 C CNN
F 1 "7k5" V 3875 3300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 3300 50  0001 C CNN
F 3 "" H 3875 3300 50  0001 C CNN
	1    3875 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3625 3150 3625 3225
Wire Wire Line
	3625 3225 4100 3225
Wire Wire Line
	4100 3225 4100 3300
Wire Wire Line
	4100 3300 4025 3300
Connection ~ 3625 3150
Wire Wire Line
	3525 3300 3725 3300
$Comp
L R R13
U 1 1 5E08EB04
P 3875 3450
F 0 "R13" V 3955 3450 50  0001 C CNN
F 1 "7k5" V 3875 3450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 3450 50  0001 C CNN
F 3 "" H 3875 3450 50  0001 C CNN
	1    3875 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3625 3300 3625 3375
Wire Wire Line
	3625 3375 4100 3375
Wire Wire Line
	4100 3375 4100 3450
Wire Wire Line
	4100 3450 4025 3450
Connection ~ 3625 3300
Wire Wire Line
	3525 3450 3725 3450
$Comp
L R R14
U 1 1 5E08ECEC
P 3875 3600
F 0 "R14" V 3955 3600 50  0001 C CNN
F 1 "7k5" V 3875 3600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 3600 50  0001 C CNN
F 3 "" H 3875 3600 50  0001 C CNN
	1    3875 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3525 3600 3725 3600
Wire Wire Line
	3625 3450 3625 3525
Wire Wire Line
	3625 3525 4100 3525
Wire Wire Line
	4100 3525 4100 3600
Wire Wire Line
	4100 3600 4025 3600
Connection ~ 3625 3450
$Comp
L R R15
U 1 1 5E08EF7F
P 3875 3750
F 0 "R15" V 3955 3750 50  0001 C CNN
F 1 "7k5" V 3875 3750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 3750 50  0001 C CNN
F 3 "" H 3875 3750 50  0001 C CNN
	1    3875 3750
	0    -1   -1   0   
$EndComp
$Comp
L R R16
U 1 1 5E08EFEC
P 3875 3900
F 0 "R16" V 3955 3900 50  0001 C CNN
F 1 "7k5" V 3875 3900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 3900 50  0001 C CNN
F 3 "" H 3875 3900 50  0001 C CNN
	1    3875 3900
	0    -1   -1   0   
$EndComp
$Comp
L R R17
U 1 1 5E08F00C
P 3875 4050
F 0 "R17" V 3955 4050 50  0001 C CNN
F 1 "7k5" V 3875 4050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3805 4050 50  0001 C CNN
F 3 "" H 3875 4050 50  0001 C CNN
	1    3875 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3525 3750 3725 3750
Wire Wire Line
	3525 3900 3725 3900
Wire Wire Line
	3525 4050 3725 4050
Wire Wire Line
	3625 3600 3625 3675
Wire Wire Line
	3625 3675 4100 3675
Wire Wire Line
	4100 3675 4100 3750
Wire Wire Line
	4100 3750 4025 3750
Connection ~ 3625 3600
Wire Wire Line
	3625 3750 3625 3825
Wire Wire Line
	3625 3825 4100 3825
Wire Wire Line
	4100 3825 4100 3900
Wire Wire Line
	4100 3900 4025 3900
Connection ~ 3625 3750
Wire Wire Line
	3625 3900 3625 3975
Wire Wire Line
	3625 3975 4100 3975
Wire Wire Line
	4100 3975 4100 4050
Wire Wire Line
	4100 4050 4025 4050
Connection ~ 3625 3900
Wire Wire Line
	3625 4050 3625 4200
Wire Wire Line
	3625 4200 3525 4200
Connection ~ 3625 4050
Wire Wire Line
	2550 4100 3150 4100
Wire Wire Line
	3125 4000 2550 4000
Wire Wire Line
	3125 3900 3125 4000
Wire Wire Line
	3125 3900 3225 3900
Wire Wire Line
	3100 3900 2550 3900
Wire Wire Line
	3100 3750 3100 3900
Wire Wire Line
	3100 3750 3225 3750
Wire Wire Line
	3075 3800 2550 3800
Wire Wire Line
	3075 3600 3075 3800
Wire Wire Line
	3075 3600 3225 3600
Wire Wire Line
	3050 3700 2550 3700
Wire Wire Line
	3050 3450 3050 3700
Wire Wire Line
	3050 3450 3225 3450
Wire Wire Line
	3025 3600 2550 3600
Wire Wire Line
	3025 3300 3025 3600
Wire Wire Line
	3025 3300 3225 3300
Wire Wire Line
	3000 3500 2550 3500
Wire Wire Line
	3000 3150 3000 3500
Wire Wire Line
	3000 3150 3225 3150
Wire Wire Line
	2975 3000 2975 3400
Wire Wire Line
	2975 3000 3225 3000
Wire Wire Line
	3150 4100 3150 4050
Wire Wire Line
	3150 4050 3225 4050
Wire Wire Line
	4575 3200 4575 3000
Wire Wire Line
	4025 3000 4975 3000
Connection ~ 4575 3000
$Comp
L TRS_3.5mm J2
U 1 1 5E090ADC
P 6825 3875
F 0 "J2" H 6825 4165 50  0000 C CNN
F 1 "TRS_3.5mm" H 6675 3675 50  0000 L CNN
F 2 "trs:Tayda_3.5mm_stereo_TRS_jack_A-853" H 7075 3975 50  0001 C CNN
F 3 "" H 7075 3975 50  0001 C CNN
	1    6825 3875
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5E090C57
P 4575 3475
F 0 "#PWR06" H 4575 3225 50  0001 C CNN
F 1 "GND" H 4575 3325 50  0000 C CNN
F 2 "" H 4575 3475 50  0001 C CNN
F 3 "" H 4575 3475 50  0001 C CNN
	1    4575 3475
	1    0    0    -1  
$EndComp
Wire Wire Line
	4575 3475 4575 3400
NoConn ~ 6625 3675
NoConn ~ 6625 3975
Wire Wire Line
	5875 3775 6625 3775
Wire Wire Line
	6625 3875 6550 3875
Wire Wire Line
	6550 3875 6550 3775
Connection ~ 6550 3775
$Comp
L GND #PWR07
U 1 1 5E091198
P 7025 4150
F 0 "#PWR07" H 7025 3900 50  0001 C CNN
F 1 "GND" H 7025 4000 50  0000 C CNN
F 2 "" H 7025 4150 50  0001 C CNN
F 3 "" H 7025 4150 50  0001 C CNN
	1    7025 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7025 4150 7025 4075
Wire Wire Line
	10525 3100 10525 4050
$Comp
L R R20
U 1 1 5E091DC4
P 10525 2950
F 0 "R20" V 10605 2950 50  0001 C CNN
F 1 "1k" V 10525 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10455 2950 50  0001 C CNN
F 3 "" H 10525 2950 50  0001 C CNN
	1    10525 2950
	-1   0    0    1   
$EndComp
$Comp
L SW_Push SW3
U 1 1 5E091DCA
P 10525 4250
F 0 "SW3" H 10575 4350 50  0000 L CNN
F 1 "SW_Push" H 10525 4190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 10525 4450 50  0001 C CNN
F 3 "" H 10525 4450 50  0001 C CNN
	1    10525 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	10800 3100 10800 4050
$Comp
L R R21
U 1 1 5E091EEC
P 10800 2950
F 0 "R21" V 10880 2950 50  0001 C CNN
F 1 "1k" V 10800 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10730 2950 50  0001 C CNN
F 3 "" H 10800 2950 50  0001 C CNN
	1    10800 2950
	-1   0    0    1   
$EndComp
$Comp
L SW_Push SW4
U 1 1 5E091EF2
P 10800 4250
F 0 "SW4" H 10850 4350 50  0000 L CNN
F 1 "SW_Push" H 10800 4190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 10800 4450 50  0001 C CNN
F 3 "" H 10800 4450 50  0001 C CNN
	1    10800 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	11075 3100 11075 4050
$Comp
L R R22
U 1 1 5E091F3D
P 11075 2950
F 0 "R22" V 11155 2950 50  0001 C CNN
F 1 "1k" V 11075 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11005 2950 50  0001 C CNN
F 3 "" H 11075 2950 50  0001 C CNN
	1    11075 2950
	-1   0    0    1   
$EndComp
$Comp
L SW_Push SW5
U 1 1 5E091F43
P 11075 4250
F 0 "SW5" H 11125 4350 50  0000 L CNN
F 1 "SW_Push" H 11075 4190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 11075 4450 50  0001 C CNN
F 3 "" H 11075 4450 50  0001 C CNN
	1    11075 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	11350 3100 11350 4050
$Comp
L R R23
U 1 1 5E091F4A
P 11350 2950
F 0 "R23" V 11430 2950 50  0001 C CNN
F 1 "1k" V 11350 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11280 2950 50  0001 C CNN
F 3 "" H 11350 2950 50  0001 C CNN
	1    11350 2950
	-1   0    0    1   
$EndComp
$Comp
L SW_Push SW6
U 1 1 5E091F50
P 11350 4250
F 0 "SW6" H 11400 4350 50  0000 L CNN
F 1 "SW_Push" H 11350 4190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 11350 4450 50  0001 C CNN
F 3 "" H 11350 4450 50  0001 C CNN
	1    11350 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	11625 3100 11625 4050
$Comp
L R R24
U 1 1 5E09204F
P 11625 2950
F 0 "R24" V 11705 2950 50  0001 C CNN
F 1 "1k" V 11625 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11555 2950 50  0001 C CNN
F 3 "" H 11625 2950 50  0001 C CNN
	1    11625 2950
	-1   0    0    1   
$EndComp
$Comp
L SW_Push SW7
U 1 1 5E092055
P 11625 4250
F 0 "SW7" H 11675 4350 50  0000 L CNN
F 1 "SW_Push" H 11625 4190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 11625 4450 50  0001 C CNN
F 3 "" H 11625 4450 50  0001 C CNN
	1    11625 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	11900 3100 11900 4050
$Comp
L R R25
U 1 1 5E09205C
P 11900 2950
F 0 "R25" V 11980 2950 50  0001 C CNN
F 1 "1k" V 11900 2950 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11830 2950 50  0001 C CNN
F 3 "" H 11900 2950 50  0001 C CNN
	1    11900 2950
	-1   0    0    1   
$EndComp
$Comp
L SW_Push SW8
U 1 1 5E092062
P 11900 4250
F 0 "SW8" H 11950 4350 50  0000 L CNN
F 1 "SW_Push" H 11900 4190 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 11900 4450 50  0001 C CNN
F 3 "" H 11900 4450 50  0001 C CNN
	1    11900 4250
	0    1    1    0   
$EndComp
Connection ~ 10525 3350
Connection ~ 10800 3450
Connection ~ 11075 3550
Connection ~ 11350 3650
Connection ~ 11625 3750
Connection ~ 11900 3850
Wire Wire Line
	10525 4500 10525 4450
Connection ~ 10250 4500
Wire Wire Line
	10800 4500 10800 4450
Connection ~ 10525 4500
Wire Wire Line
	11075 4500 11075 4450
Connection ~ 10800 4500
Wire Wire Line
	11350 4500 11350 4450
Connection ~ 11075 4500
Wire Wire Line
	11625 4500 11625 4450
Connection ~ 11350 4500
Wire Wire Line
	11900 4450 11900 4575
Connection ~ 11625 4500
Connection ~ 11900 4500
Wire Wire Line
	10525 2700 10525 2800
Connection ~ 10250 2700
Wire Wire Line
	10800 2700 10800 2800
Connection ~ 10525 2700
Wire Wire Line
	11075 2700 11075 2800
Connection ~ 10800 2700
Wire Wire Line
	11350 2700 11350 2800
Connection ~ 11075 2700
Wire Wire Line
	11625 2700 11625 2800
Connection ~ 11350 2700
Wire Wire Line
	11900 2700 11900 2800
Connection ~ 11625 2700
Connection ~ 9975 2700
$Comp
L Speaker LS1
U 1 1 5E0947B1
P 6900 2625
F 0 "LS1" H 6950 2850 50  0000 R CNN
F 1 "Speaker" H 6950 2775 50  0000 R CNN
F 2 "speaker:Mini_Speaker" H 6900 2425 50  0001 C CNN
F 3 "" H 6890 2575 50  0001 C CNN
	1    6900 2625
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2625 6625 2625
Wire Wire Line
	6625 2625 6625 2350
$Comp
L VCC #PWR08
U 1 1 5E094B3E
P 6625 2150
F 0 "#PWR08" H 6625 2000 50  0001 C CNN
F 1 "VCC" H 6625 2300 50  0000 C CNN
F 2 "" H 6625 2150 50  0001 C CNN
F 3 "" H 6625 2150 50  0001 C CNN
	1    6625 2150
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP1
U 1 1 5E094B70
P 6625 2250
F 0 "JP1" H 6625 2330 50  0000 C CNN
F 1 "SPKR_EN" H 6635 2190 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 6625 2250 50  0001 C CNN
F 3 "" H 6625 2250 50  0001 C CNN
	1    6625 2250
	0    1    1    0   
$EndComp
$Comp
L 2N3904 Q1
U 1 1 5E094EB3
P 6525 3000
F 0 "Q1" H 6725 3075 50  0000 L CNN
F 1 "2N3904" H 6725 3000 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow" H 6725 2925 50  0001 L CIN
F 3 "" H 6525 3000 50  0001 L CNN
	1    6525 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6625 2800 6625 2725
Wire Wire Line
	6625 2725 6700 2725
$Comp
L GND #PWR09
U 1 1 5E09507B
P 6625 3200
F 0 "#PWR09" H 6625 2950 50  0001 C CNN
F 1 "GND" H 6625 3050 50  0000 C CNN
F 2 "" H 6625 3200 50  0001 C CNN
F 3 "" H 6625 3200 50  0001 C CNN
	1    6625 3200
	1    0    0    -1  
$EndComp
$Comp
L R R26
U 1 1 5E095104
P 6100 3000
F 0 "R26" V 6180 3000 50  0001 C CNN
F 1 "220" V 6100 3000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 3000 50  0001 C CNN
F 3 "" H 6100 3000 50  0001 C CNN
	1    6100 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 3000 6325 3000
Wire Wire Line
	5875 3775 5875 3000
Wire Wire Line
	5175 3000 5950 3000
Connection ~ 5875 3000
$EndSCHEMATC
