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
LIBS:mounting
LIBS:rc1_backplane
LIBS:PP Backplane Extension-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "PP Backplane extension"
Date ""
Rev "A"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Mounting M1
U 1 1 5D63FD8B
P 10775 650
F 0 "M1" H 10775 750 50  0001 C CNN
F 1 "Mounting" H 10775 575 50  0001 C CNN
F 2 "mounting:1pin" H 10775 650 50  0001 C CNN
F 3 "" H 10775 650 50  0001 C CNN
	1    10775 650 
	1    0    0    -1  
$EndComp
$Comp
L Mounting M2
U 1 1 5D63FDB2
P 10900 650
F 0 "M2" H 10900 750 50  0001 C CNN
F 1 "Mounting" H 10900 575 50  0001 C CNN
F 2 "mounting:1pin" H 10900 650 50  0001 C CNN
F 3 "" H 10900 650 50  0001 C CNN
	1    10900 650 
	1    0    0    -1  
$EndComp
$Comp
L Mounting M3
U 1 1 5D63FDD2
P 11025 650
F 0 "M3" H 11025 750 50  0001 C CNN
F 1 "Mounting" H 11025 575 50  0001 C CNN
F 2 "mounting:1pin" H 11025 650 50  0001 C CNN
F 3 "" H 11025 650 50  0001 C CNN
	1    11025 650 
	1    0    0    -1  
$EndComp
$Comp
L Mounting M4
U 1 1 5D63FDF2
P 11150 650
F 0 "M4" H 11150 750 50  0001 C CNN
F 1 "Mounting" H 11150 575 50  0001 C CNN
F 2 "mounting:1pin" H 11150 650 50  0001 C CNN
F 3 "" H 11150 650 50  0001 C CNN
	1    11150 650 
	1    0    0    -1  
$EndComp
Entry Wire Line
	7900 4225 7800 4325
Text Label 8275 4225 2    60   ~ 0
~NMI
Text Label 8275 5325 2    60   ~ 0
D7
Text Label 8275 5225 2    60   ~ 0
D6
Text Label 8275 5125 2    60   ~ 0
D5
Text Label 8275 5025 2    60   ~ 0
D4
Text Label 8275 4925 2    60   ~ 0
D3
Text Label 8275 4825 2    60   ~ 0
D2
Text Label 8275 4725 2    60   ~ 0
D1
Text Label 8275 4625 2    60   ~ 0
D0
Text Label 8275 4525 2    60   ~ 0
SYNC
Text Label 8275 4425 2    60   ~ 0
~RDY
Text Label 8275 4325 2    60   ~ 0
R/~W
Text Label 8275 4125 2    60   ~ 0
~IRQ
Entry Wire Line
	7900 5325 7800 5425
Entry Wire Line
	7900 5225 7800 5325
Entry Wire Line
	7900 5125 7800 5225
Entry Wire Line
	7900 5025 7800 5125
Entry Wire Line
	7900 4925 7800 5025
Entry Wire Line
	7900 4825 7800 4925
Entry Wire Line
	7900 4725 7800 4825
Entry Wire Line
	7900 4625 7800 4725
Entry Wire Line
	7900 4525 7800 4625
Entry Wire Line
	7900 4425 7800 4525
Entry Wire Line
	7900 4325 7800 4425
Entry Wire Line
	7900 4125 7800 4225
Text Label 8275 2025 2    60   ~ 0
A15
Text Label 8275 2125 2    60   ~ 0
A14
Text Label 8275 2225 2    60   ~ 0
A13
Text Label 8275 2325 2    60   ~ 0
A12
Entry Wire Line
	7800 3325 7900 3425
Entry Wire Line
	7800 3225 7900 3325
Entry Wire Line
	7800 3125 7900 3225
Entry Wire Line
	7800 3025 7900 3125
Text Label 8275 2425 2    60   ~ 0
A11
Text Label 8275 2525 2    60   ~ 0
A10
Text Label 8275 2625 2    60   ~ 0
A9
Text Label 8275 2725 2    60   ~ 0
A8
Text Label 8275 2825 2    60   ~ 0
A7
Text Label 8275 2925 2    60   ~ 0
A6
Text Label 8275 3025 2    60   ~ 0
A5
Text Label 8275 3125 2    60   ~ 0
A4
Text Label 8275 3225 2    60   ~ 0
A3
Text Label 8275 3325 2    60   ~ 0
A2
Text Label 8275 3425 2    60   ~ 0
A1
Text Label 8275 3525 2    60   ~ 0
A0
Entry Wire Line
	7800 3425 7900 3525
Entry Wire Line
	7800 2925 7900 3025
Entry Wire Line
	7800 2825 7900 2925
Entry Wire Line
	7800 2725 7900 2825
Entry Wire Line
	7800 2625 7900 2725
Entry Wire Line
	7800 2525 7900 2625
Entry Wire Line
	7800 2425 7900 2525
Entry Wire Line
	7800 2325 7900 2425
Entry Wire Line
	7800 2225 7900 2325
Entry Wire Line
	7800 2125 7900 2225
Entry Wire Line
	7800 2025 7900 2125
Entry Wire Line
	7800 1925 7900 2025
$Comp
L VCC #PWR01
U 1 1 5D63F697
P 7675 3500
F 0 "#PWR01" H 7675 3350 50  0001 C CNN
F 1 "VCC" H 7675 3650 50  0000 C CNN
F 2 "" H 7675 3500 50  0001 C CNN
F 3 "" H 7675 3500 50  0001 C CNN
	1    7675 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5D63F634
P 7600 3700
F 0 "#PWR02" H 7600 3450 50  0001 C CNN
F 1 "GND" H 7600 3550 50  0000 C CNN
F 2 "" H 7600 3700 50  0001 C CNN
F 3 "" H 7600 3700 50  0001 C CNN
	1    7600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4225 7900 4225
Wire Bus Line
	7800 2725 7475 2725
Wire Bus Line
	7800 3925 7800 5925
Wire Bus Line
	7800 1925 7800 3425
Wire Wire Line
	7900 5325 8300 5325
Wire Wire Line
	7900 5225 8300 5225
Wire Wire Line
	7900 5125 8300 5125
Wire Wire Line
	7900 5025 8300 5025
Wire Wire Line
	7900 4925 8300 4925
Wire Wire Line
	7900 4825 8300 4825
Wire Wire Line
	7900 4725 8300 4725
Wire Wire Line
	7900 4625 8300 4625
Wire Wire Line
	7900 4525 8300 4525
Wire Wire Line
	7900 4425 8300 4425
Wire Wire Line
	7900 4325 8300 4325
Wire Wire Line
	7900 4125 8300 4125
Wire Wire Line
	7900 3425 8300 3425
Wire Wire Line
	7900 3325 8300 3325
Wire Wire Line
	7900 3225 8300 3225
Wire Wire Line
	7900 3125 8300 3125
Wire Wire Line
	7900 3525 8300 3525
Wire Wire Line
	7900 3025 8300 3025
Wire Wire Line
	7900 2925 8300 2925
Wire Wire Line
	7900 2825 8300 2825
Wire Wire Line
	7900 2725 8300 2725
Wire Wire Line
	7900 2625 8300 2625
Wire Wire Line
	7900 2525 8300 2525
Wire Wire Line
	7900 2425 8300 2425
Wire Wire Line
	7900 2325 8300 2325
Wire Wire Line
	7900 2225 8300 2225
Wire Wire Line
	7900 2125 8300 2125
Wire Wire Line
	7900 2025 8300 2025
Wire Wire Line
	7675 3725 8300 3725
Wire Wire Line
	7675 3500 7675 3725
Wire Wire Line
	7600 3625 8300 3625
$Comp
L RC1_Backplane J1
U 1 1 5DC149FA
P 8500 3925
F 0 "J1" H 8500 5925 50  0000 C CNN
F 1 "Backplane" V 8950 3875 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x39_Pitch2.54mm" H 8500 3925 50  0001 C CNN
F 3 "" H 8500 3925 50  0001 C CNN
	1    8500 3925
	1    0    0    -1  
$EndComp
Wire Bus Line
	7475 4725 7800 4725
Wire Wire Line
	7600 3625 7600 3700
Entry Wire Line
	7900 3825 7800 3925
Wire Wire Line
	7900 3825 8300 3825
Entry Wire Line
	7900 3925 7800 4025
Wire Wire Line
	7900 3925 8300 3925
Text Label 8275 3925 2    60   ~ 0
~RESET
Entry Wire Line
	7900 4025 7800 4125
Wire Wire Line
	7900 4025 8300 4025
Entry Wire Line
	7900 5825 7800 5925
Entry Wire Line
	7900 5725 7800 5825
Entry Wire Line
	7900 5625 7800 5725
Entry Wire Line
	7900 5525 7800 5625
Entry Wire Line
	7900 5425 7800 5525
Wire Wire Line
	7900 5825 8300 5825
Wire Wire Line
	7900 5725 8300 5725
Wire Wire Line
	7900 5625 8300 5625
Wire Wire Line
	7900 5525 8300 5525
Wire Wire Line
	7900 5425 8300 5425
Text Label 8275 5425 2    60   ~ 0
PIN35
Text Label 8275 5525 2    60   ~ 0
PIN36
Text Label 8275 5625 2    60   ~ 0
PIN37
Text Label 8275 5825 2    60   ~ 0
PIN39
Entry Wire Line
	4075 4225 3975 4325
Text Label 4450 4225 2    60   ~ 0
~NMI
Text Label 4450 5325 2    60   ~ 0
D7
Text Label 4450 5225 2    60   ~ 0
D6
Text Label 4450 5125 2    60   ~ 0
D5
Text Label 4450 5025 2    60   ~ 0
D4
Text Label 4450 4925 2    60   ~ 0
D3
Text Label 4450 4825 2    60   ~ 0
D2
Text Label 4450 4725 2    60   ~ 0
D1
Text Label 4450 4625 2    60   ~ 0
D0
Text Label 4450 4525 2    60   ~ 0
SYNC
Text Label 4450 4425 2    60   ~ 0
~RDY
Text Label 4450 4325 2    60   ~ 0
R/~W
Text Label 4450 4125 2    60   ~ 0
~IRQ
Entry Wire Line
	4075 5325 3975 5425
Entry Wire Line
	4075 5225 3975 5325
Entry Wire Line
	4075 5125 3975 5225
Entry Wire Line
	4075 5025 3975 5125
Entry Wire Line
	4075 4925 3975 5025
Entry Wire Line
	4075 4825 3975 4925
Entry Wire Line
	4075 4725 3975 4825
Entry Wire Line
	4075 4625 3975 4725
Entry Wire Line
	4075 4525 3975 4625
Entry Wire Line
	4075 4425 3975 4525
Entry Wire Line
	4075 4325 3975 4425
Entry Wire Line
	4075 4125 3975 4225
Text Label 4450 2025 2    60   ~ 0
A15
Text Label 4450 2125 2    60   ~ 0
A14
Text Label 4450 2225 2    60   ~ 0
A13
Text Label 4450 2325 2    60   ~ 0
A12
Entry Wire Line
	3975 3325 4075 3425
Entry Wire Line
	3975 3225 4075 3325
Entry Wire Line
	3975 3125 4075 3225
Entry Wire Line
	3975 3025 4075 3125
Text Label 4450 2425 2    60   ~ 0
A11
Text Label 4450 2525 2    60   ~ 0
A10
Text Label 4450 2625 2    60   ~ 0
A9
Text Label 4450 2725 2    60   ~ 0
A8
Text Label 4450 2825 2    60   ~ 0
A7
Text Label 4450 2925 2    60   ~ 0
A6
Text Label 4450 3025 2    60   ~ 0
A5
Text Label 4450 3125 2    60   ~ 0
A4
Text Label 4450 3225 2    60   ~ 0
A3
Text Label 4450 3325 2    60   ~ 0
A2
Text Label 4450 3425 2    60   ~ 0
A1
Text Label 4450 3525 2    60   ~ 0
A0
Entry Wire Line
	3975 3425 4075 3525
Entry Wire Line
	3975 2925 4075 3025
Entry Wire Line
	3975 2825 4075 2925
Entry Wire Line
	3975 2725 4075 2825
Entry Wire Line
	3975 2625 4075 2725
Entry Wire Line
	3975 2525 4075 2625
Entry Wire Line
	3975 2425 4075 2525
Entry Wire Line
	3975 2325 4075 2425
Entry Wire Line
	3975 2225 4075 2325
Entry Wire Line
	3975 2125 4075 2225
Entry Wire Line
	3975 2025 4075 2125
Entry Wire Line
	3975 1925 4075 2025
$Comp
L VCC #PWR03
U 1 1 5DD0D2FE
P 3850 3500
F 0 "#PWR03" H 3850 3350 50  0001 C CNN
F 1 "VCC" H 3850 3650 50  0000 C CNN
F 2 "" H 3850 3500 50  0001 C CNN
F 3 "" H 3850 3500 50  0001 C CNN
	1    3850 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5DD0D304
P 3775 3700
F 0 "#PWR04" H 3775 3450 50  0001 C CNN
F 1 "GND" H 3775 3550 50  0000 C CNN
F 2 "" H 3775 3700 50  0001 C CNN
F 3 "" H 3775 3700 50  0001 C CNN
	1    3775 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4475 4225 4075 4225
Wire Bus Line
	3975 2725 3650 2725
Wire Bus Line
	3975 3925 3975 5925
Wire Bus Line
	3975 1925 3975 3425
Wire Wire Line
	4075 5325 4475 5325
Wire Wire Line
	4075 5225 4475 5225
Wire Wire Line
	4075 5125 4475 5125
Wire Wire Line
	4075 5025 4475 5025
Wire Wire Line
	4075 4925 4475 4925
Wire Wire Line
	4075 4825 4475 4825
Wire Wire Line
	4075 4725 4475 4725
Wire Wire Line
	4075 4625 4475 4625
Wire Wire Line
	4075 4525 4475 4525
Wire Wire Line
	4075 4425 4475 4425
Wire Wire Line
	4075 4325 4475 4325
Wire Wire Line
	4075 4125 4475 4125
Wire Wire Line
	4075 3425 4475 3425
Wire Wire Line
	4075 3325 4475 3325
Wire Wire Line
	4075 3225 4475 3225
Wire Wire Line
	4075 3125 4475 3125
Wire Wire Line
	4075 3525 4475 3525
Wire Wire Line
	4075 3025 4475 3025
Wire Wire Line
	4075 2925 4475 2925
Wire Wire Line
	4075 2825 4475 2825
Wire Wire Line
	4075 2725 4475 2725
Wire Wire Line
	4075 2625 4475 2625
Wire Wire Line
	4075 2525 4475 2525
Wire Wire Line
	4075 2425 4475 2425
Wire Wire Line
	4075 2325 4475 2325
Wire Wire Line
	4075 2225 4475 2225
Wire Wire Line
	4075 2125 4475 2125
Wire Wire Line
	4075 2025 4475 2025
Wire Wire Line
	3850 3725 4475 3725
Wire Wire Line
	3850 3500 3850 3725
Wire Wire Line
	3775 3625 4475 3625
$Comp
L RC1_Backplane J2
U 1 1 5DD0D32D
P 4675 3925
F 0 "J2" H 4675 5925 50  0000 C CNN
F 1 "Project Platform" V 5125 3875 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x39_Pitch2.54mm" H 4675 3925 50  0001 C CNN
F 3 "" H 4675 3925 50  0001 C CNN
	1    4675 3925
	1    0    0    -1  
$EndComp
Wire Bus Line
	3650 4725 3975 4725
Wire Wire Line
	3775 3625 3775 3700
Entry Wire Line
	4075 3825 3975 3925
Wire Wire Line
	4075 3825 4475 3825
Entry Wire Line
	4075 3925 3975 4025
Wire Wire Line
	4075 3925 4475 3925
Text Label 4450 3825 2    60   ~ 0
PHI2
Text Label 4450 3925 2    60   ~ 0
~RESET
Entry Wire Line
	4075 4025 3975 4125
Wire Wire Line
	4075 4025 4475 4025
Entry Wire Line
	4075 5825 3975 5925
Entry Wire Line
	4075 5725 3975 5825
Entry Wire Line
	4075 5625 3975 5725
Entry Wire Line
	4075 5525 3975 5625
Entry Wire Line
	4075 5425 3975 5525
Wire Wire Line
	4075 5825 4475 5825
Wire Wire Line
	4075 5725 4475 5725
Wire Wire Line
	4075 5625 4475 5625
Wire Wire Line
	4075 5525 4475 5525
Wire Wire Line
	4075 5425 4475 5425
Text Label 4450 5425 2    60   ~ 0
PIN35
Text Label 4450 5525 2    60   ~ 0
PIN36
Text Label 4450 5625 2    60   ~ 0
PIN37
Text Label 4450 5725 2    60   ~ 0
~IO3
Text Label 4450 5825 2    60   ~ 0
PIN39
$Comp
L C_Small C1
U 1 1 5DD0E0B6
P 6700 7375
F 0 "C1" H 6710 7445 50  0000 L CNN
F 1 "100nF" H 6710 7295 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6700 7375 50  0001 C CNN
F 3 "" H 6700 7375 50  0001 C CNN
	1    6700 7375
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5DD0E2DE
P 6700 7475
F 0 "#PWR05" H 6700 7225 50  0001 C CNN
F 1 "GND" H 6700 7325 50  0000 C CNN
F 2 "" H 6700 7475 50  0001 C CNN
F 3 "" H 6700 7475 50  0001 C CNN
	1    6700 7475
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR06
U 1 1 5DD0E425
P 6700 7275
F 0 "#PWR06" H 6700 7125 50  0001 C CNN
F 1 "VCC" H 6700 7425 50  0000 C CNN
F 2 "" H 6700 7275 50  0001 C CNN
F 3 "" H 6700 7275 50  0001 C CNN
	1    6700 7275
	1    0    0    -1  
$EndComp
Text Label 8275 3825 2    60   ~ 0
PHI2
Text Label 8275 4025 2    60   ~ 0
PHI0
Text Label 4450 4025 2    60   ~ 0
PHI0
Text Label 8275 5725 2    60   ~ 0
~IO3
Wire Bus Line
	3650 4725 3650 1700
Wire Bus Line
	3650 1700 7475 1700
Wire Bus Line
	7475 1700 7475 4725
Text Notes 7000 6850 0    60   ~ 0
Made to bridge between the standard RC6502 backplane and the project platform boards, \ncan be made to plug into the top or soldered permanently in place. M3 mounting screws\nand nuts can be used for added strength.
$EndSCHEMATC
