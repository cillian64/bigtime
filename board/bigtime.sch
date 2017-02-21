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
LIBS:sa40-19
LIBS:bigtime-cache
EELAYER 26 0
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
$Comp
L NPIC6C596A IC1
U 1 1 58AB641E
P 5500 4750
F 0 "IC1" H 5500 5475 50  0000 C CNN
F 1 "NPIC6C596A" H 5500 5384 50  0000 C CNN
F 2 "agg:TSSOP-16" H -700 -900 50  0001 L CNN
F 3 "http://assets.nexperia.com/documents/data-sheet/NPIC6C596A.pdf" H -700 -1000 50  0001 L CNN
F 4 "2445196" H -700 -1100 50  0001 L CNN "Farnell"
	1    5500 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 58AB653E
P 3000 1550
F 0 "#PWR6" H -200 100 50  0001 C CNN
F 1 "GND" H 3005 1377 50  0000 C CNN
F 2 "" H -200 350 50  0000 C CNN
F 3 "" H -200 350 50  0000 C CNN
	1    3000 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 58AB65DB
P 3900 1550
F 0 "#PWR7" H -50 -350 50  0001 C CNN
F 1 "GND" H 3905 1377 50  0000 C CNN
F 2 "" H -50 -100 50  0000 C CNN
F 3 "" H -50 -100 50  0000 C CNN
	1    3900 1550
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR1
U 1 1 58AB65F8
P 3250 950
F 0 "#PWR1" H -250 -400 50  0001 C CNN
F 1 "+12V" H 3265 1123 50  0000 C CNN
F 2 "" H -250 -250 50  0000 C CNN
F 3 "" H -250 -250 50  0000 C CNN
	1    3250 950 
	1    0    0    -1  
$EndComp
Text Label 3000 1250 0    60   ~ 0
DS_IN
Text Label 3900 1250 2    60   ~ 0
DS_OUT
Text Label 5100 4850 2    60   ~ 0
DS_IN
Text Label 6000 5250 0    60   ~ 0
DS_OUT
Text Label 3300 1350 0    60   ~ 0
SHCP
Text Label 3300 1450 0    60   ~ 0
STCP
Wire Wire Line
	3000 1350 3900 1350
Wire Wire Line
	3900 1450 3000 1450
Text Label 5100 4950 2    60   ~ 0
SHCP
Text Label 5100 5050 2    60   ~ 0
STCP
Text Label 1850 4800 0    60   ~ 0
DS_IN
Text Label 1850 4950 0    60   ~ 0
SHCP
Text Label 1850 5000 0    60   ~ 0
STCP
$Comp
L +3V3 #PWR2
U 1 1 58AB6B00
P 3550 950
F 0 "#PWR2" H -100 -200 50  0001 C CNN
F 1 "+3V3" H 3565 1123 50  0000 C CNN
F 2 "" H -100 -50 50  0000 C CNN
F 3 "" H -100 -50 50  0000 C CNN
	1    3550 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 950  3550 1150
Wire Wire Line
	3000 1150 3900 1150
Connection ~ 3550 1150
Wire Wire Line
	3250 950  3250 1050
Wire Wire Line
	3000 1050 3900 1050
Connection ~ 3250 1050
$Comp
L CONN_01X06 P1
U 1 1 58AB6B62
P 2800 1300
F 0 "P1" H 2719 825 50  0000 C CNN
F 1 "CONN_IN" H 2719 916 50  0000 C CNN
F 2 "agg:SIL-254P-06" H -300 100 50  0001 C CNN
F 3 "" H -300 100 50  0000 C CNN
	1    2800 1300
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X06 P2
U 1 1 58AB6BAF
P 4100 1300
F 0 "P2" H 4018 825 50  0000 C CNN
F 1 "CONN_OUT" H 4018 916 50  0000 C CNN
F 2 "agg:SIL-254P-06" H 1000 100 50  0001 C CNN
F 3 "" H 1000 100 50  0000 C CNN
	1    4100 1300
	1    0    0    1   
$EndComp
$Comp
L TPS62152 IC2
U 1 1 58AB6DDC
P 7000 1650
F 0 "IC2" H 7000 2475 50  0000 C CNN
F 1 "TPS62152" H 7000 2384 50  0000 C CNN
F 2 "agg:QFN-16-EP-TI" H -150 -200 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62152.pdf" H -150 -300 50  0001 L CNN
F 4 "2382918" H -150 -400 50  0001 L CNN "Farnell"
	1    7000 1650
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR3
U 1 1 58AB6FA8
P 6000 950
F 0 "#PWR3" H -600 -450 50  0001 C CNN
F 1 "+12V" H 6015 1123 50  0000 C CNN
F 2 "" H -600 -300 50  0000 C CNN
F 3 "" H -600 -300 50  0000 C CNN
	1    6000 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 950  6000 1050
Wire Wire Line
	6000 1050 6600 1050
Wire Wire Line
	6500 1050 6500 1350
Wire Wire Line
	6500 1150 6600 1150
Connection ~ 6500 1050
Wire Wire Line
	6500 1250 6600 1250
Connection ~ 6500 1150
$Comp
L C C2
U 1 1 58AB7017
P 6000 1200
F 0 "C2" H 6115 1246 50  0000 L CNN
F 1 "10u" H 6115 1155 50  0000 L CNN
F 2 "agg:0603" H 188 -150 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1955679.pdf" H 150 0   50  0001 C CNN
F 4 "2494230" H 6000 1200 60  0001 C CNN "Farnell"
	1    6000 1200
	1    0    0    -1  
$EndComp
Connection ~ 6000 1050
$Comp
L GND #PWR8
U 1 1 58AB7079
P 6000 1600
F 0 "#PWR8" H -200 0   50  0001 C CNN
F 1 "GND" H 6005 1427 50  0000 C CNN
F 2 "" H -200 250 50  0000 C CNN
F 3 "" H -200 250 50  0000 C CNN
	1    6000 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1350 6600 1350
Connection ~ 6500 1250
$Comp
L GND #PWR10
U 1 1 58AB711C
P 6500 2350
F 0 "#PWR10" H 150 -300 50  0001 C CNN
F 1 "GND" H 6505 2177 50  0000 C CNN
F 2 "" H 150 -50 50  0000 C CNN
F 3 "" H 150 -50 50  0000 C CNN
	1    6500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2250 6600 2250
Wire Wire Line
	6500 1750 6500 2350
Wire Wire Line
	6600 2150 6500 2150
Connection ~ 6500 2250
Wire Wire Line
	6600 2050 6500 2050
Connection ~ 6500 2150
Wire Wire Line
	6600 1950 6500 1950
Connection ~ 6500 2050
Wire Wire Line
	6600 1850 6500 1850
Connection ~ 6500 1950
Wire Wire Line
	6600 1750 6500 1750
Connection ~ 6500 1850
Wire Wire Line
	7400 1450 7500 1450
Wire Wire Line
	7500 1450 7500 1850
$Comp
L GND #PWR9
U 1 1 58AB72DE
P 7500 1850
F 0 "#PWR9" H 0   -150 50  0001 C CNN
F 1 "GND" H 7505 1677 50  0000 C CNN
F 2 "" H 0   100 50  0000 C CNN
F 3 "" H 0   100 50  0000 C CNN
	1    7500 1850
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR_SMALL L1
U 1 1 58AB73EF
P 7800 1050
F 0 "L1" H 7800 1265 50  0000 C CNN
F 1 "2u2" H 7800 1174 50  0000 C CNN
F 2 "footprints:L2520" H -300 0   50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/74479887222C.pdf" H -300 0   50  0001 C CNN
F 4 "2543271" H 7800 1050 60  0001 C CNN "Farnell"
	1    7800 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1250 7400 1250
Wire Wire Line
	7500 1050 7500 1250
Wire Wire Line
	7400 1050 7550 1050
Connection ~ 7500 1050
Wire Wire Line
	7400 1150 7500 1150
Connection ~ 7500 1150
Wire Wire Line
	8050 1050 8700 1050
Wire Wire Line
	8150 1050 8150 1550
Wire Wire Line
	8150 1550 7400 1550
$Comp
L C C4
U 1 1 58AB75BC
P 8350 1200
F 0 "C4" H 8465 1246 50  0000 L CNN
F 1 "22u" H 8465 1155 50  0000 L CNN
F 2 "agg:0805" H -112 -150 50  0001 C CNN
F 3 "" H -150 0   50  0000 C CNN
	1    8350 1200
	1    0    0    -1  
$EndComp
Connection ~ 8150 1050
Wire Wire Line
	8700 1050 8700 1000
Connection ~ 8350 1050
$Comp
L +3V3 #PWR4
U 1 1 58AB765A
P 8700 1000
F 0 "#PWR4" H 8750 1050 50  0001 C CNN
F 1 "+3V3" H 8715 1173 50  0000 C CNN
F 2 "" H -100 -100 50  0000 C CNN
F 3 "" H -100 -100 50  0000 C CNN
	1    8700 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 58AB76DE
P 8350 1350
F 0 "#PWR5" H 250 -450 50  0001 C CNN
F 1 "GND" H 8355 1177 50  0000 C CNN
F 2 "" H 250 -200 50  0000 C CNN
F 3 "" H 250 -200 50  0000 C CNN
	1    8350 1350
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 58AB7880
P 6400 1550
F 0 "C3" V 6148 1550 50  0000 C CNN
F 1 "3.3n" V 6239 1550 50  0000 C CNN
F 2 "agg:0603" H 288 100 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1958513.pdf" H 250 250 50  0001 C CNN
F 4 "2496853" H 6400 1550 60  0001 C CNN "Farnell"
	1    6400 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 1350 6000 1600
Wire Wire Line
	6250 1550 6000 1550
Connection ~ 6000 1550
Wire Wire Line
	6550 1550 6600 1550
Wire Wire Line
	7400 1650 7500 1650
Connection ~ 7500 1650
$Comp
L C C1
U 1 1 58AB8171
P 4650 4200
F 0 "C1" H 4765 4246 50  0000 L CNN
F 1 "100n" H 4765 4155 50  0000 L CNN
F 2 "agg:0603" H 188 -1150 50  0001 C CNN
F 3 "" H 150 -1000 50  0000 C CNN
	1    4650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4350 5100 4350
$Comp
L GND #PWR13
U 1 1 58AB81EC
P 4650 4350
F 0 "#PWR13" H 250 -950 50  0001 C CNN
F 1 "GND" H 4655 4177 50  0000 C CNN
F 2 "" H 250 -700 50  0000 C CNN
F 3 "" H 250 -700 50  0000 C CNN
	1    4650 4350
	1    0    0    -1  
$EndComp
Connection ~ 4650 4350
Wire Wire Line
	4650 4050 4900 4050
Wire Wire Line
	4900 4050 4900 4250
Wire Wire Line
	4900 4250 5100 4250
$Comp
L +3V3 #PWR12
U 1 1 58AB83D7
P 4650 4050
F 0 "#PWR12" H 200 -750 50  0001 C CNN
F 1 "+3V3" H 4665 4223 50  0000 C CNN
F 2 "" H 200 -600 50  0000 C CNN
F 3 "" H 200 -600 50  0000 C CNN
	1    4650 4050
	1    0    0    -1  
$EndComp
Connection ~ 4650 4050
Wire Wire Line
	5100 4650 4950 4650
Wire Wire Line
	4950 4650 4950 4350
Connection ~ 4950 4350
Wire Wire Line
	5100 4550 5050 4550
Wire Wire Line
	5050 4550 5050 4250
Connection ~ 5050 4250
$Comp
L SA40-19 U1
U 1 1 58AB8F4C
P 7350 4450
F 0 "U1" H 7778 4508 60  0000 L CNN
F 1 "SA40-19" H 7778 4402 60  0000 L CNN
F 2 "footprints:SA40-18" H -400 -700 60  0001 C CNN
F 3 "" H -400 -700 60  0001 C CNN
	1    7350 4450
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR11
U 1 1 58AB91CE
P 6550 3850
F 0 "#PWR11" H 150 250 50  0001 C CNN
F 1 "+12V" H 6565 4023 50  0000 C CNN
F 2 "" H 150 400 50  0000 C CNN
F 3 "" H 150 400 50  0000 C CNN
	1    6550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3850 6550 4050
Wire Wire Line
	6550 3950 6650 3950
Wire Wire Line
	6550 4050 6650 4050
Connection ~ 6550 3950
$Comp
L R R1
U 1 1 58AC6016
P 6100 4250
F 0 "R1" V 6100 4250 50  0000 C CNN
F 1 "220R 500mW" V 6000 4400 50  0000 C CNN
F 2 "agg:1206" V 130 450 50  0001 C CNN
F 3 "" H 200 450 50  0001 C CNN
	1    6100 4250
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 58AC6381
P 6450 4950
F 0 "R8" V 6450 4950 50  0000 C CNN
F 1 "400R 500mW" V 6350 4950 50  0000 C CNN
F 2 "agg:1206" V 480 1150 50  0001 C CNN
F 3 "" H 550 1150 50  0001 C CNN
	1    6450 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 5150 5950 5150
Wire Wire Line
	5950 5150 5950 5250
Wire Wire Line
	5950 5250 6000 5250
Wire Wire Line
	5900 4250 5950 4250
Wire Wire Line
	6250 4250 6650 4250
Wire Wire Line
	5900 4350 6300 4350
Wire Wire Line
	6600 4350 6650 4350
Wire Wire Line
	5900 4450 5950 4450
Wire Wire Line
	6250 4450 6650 4450
Wire Wire Line
	5900 4550 6300 4550
Wire Wire Line
	6600 4550 6650 4550
Wire Wire Line
	5900 4650 5950 4650
Wire Wire Line
	6250 4650 6650 4650
Wire Wire Line
	5900 4750 6300 4750
Wire Wire Line
	6600 4750 6650 4750
Wire Wire Line
	5900 4850 5950 4850
Wire Wire Line
	6250 4850 6650 4850
Wire Wire Line
	5900 4950 6300 4950
Wire Wire Line
	6600 4950 6650 4950
$Comp
L R R2
U 1 1 58AC75A0
P 6450 4350
F 0 "R2" V 6450 4350 50  0000 C CNN
F 1 "220R 500mW" V 6350 4500 50  0001 C CNN
F 2 "agg:1206" V 480 550 50  0001 C CNN
F 3 "" H 550 550 50  0001 C CNN
	1    6450 4350
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 58AC76CC
P 6100 4450
F 0 "R3" V 6100 4450 50  0000 C CNN
F 1 "220R 500mW" V 6000 4600 50  0001 C CNN
F 2 "agg:1206" V 130 650 50  0001 C CNN
F 3 "" H 200 650 50  0001 C CNN
	1    6100 4450
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 58AC7704
P 6450 4550
F 0 "R4" V 6450 4550 50  0000 C CNN
F 1 "220R 500mW" V 6350 4700 50  0001 C CNN
F 2 "agg:1206" V 480 750 50  0001 C CNN
F 3 "" H 550 750 50  0001 C CNN
	1    6450 4550
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 58AC773E
P 6100 4650
F 0 "R5" V 6100 4650 50  0000 C CNN
F 1 "220R 500mW" V 6000 4800 50  0001 C CNN
F 2 "agg:1206" V 130 850 50  0001 C CNN
F 3 "" H 200 850 50  0001 C CNN
	1    6100 4650
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 58AC777C
P 6450 4750
F 0 "R6" V 6450 4750 50  0000 C CNN
F 1 "220R 500mW" V 6350 4900 50  0001 C CNN
F 2 "agg:1206" V 480 950 50  0001 C CNN
F 3 "" H 550 950 50  0001 C CNN
	1    6450 4750
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 58AC77BA
P 6100 4850
F 0 "R7" V 6100 4850 50  0000 C CNN
F 1 "220R 500mW" V 6000 5000 50  0001 C CNN
F 2 "agg:1206" V 130 1050 50  0001 C CNN
F 3 "" H 200 1050 50  0001 C CNN
	1    6100 4850
	0    1    1    0   
$EndComp
$EndSCHEMATC
