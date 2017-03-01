EESchema Schematic File Version 2
LIBS:bigtime-rescue
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
LIBS:npic6c596a
LIBS:tps62152
LIBS:sa40-19
LIBS:part
LIBS:749010012a
LIBS:ksz8081rnx
LIBS:bigtime-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
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
P 7500 5550
F 0 "IC1" H 7500 6275 50  0000 C CNN
F 1 "NPIC6C596A" H 7500 6184 50  0000 C CNN
F 2 "agg:TSSOP-16" H 1300 -100 50  0001 L CNN
F 3 "http://assets.nexperia.com/documents/data-sheet/NPIC6C596A.pdf" H 1300 -200 50  0001 L CNN
F 4 "2445196" H 1300 -300 50  0001 L CNN "Farnell"
	1    7500 5550
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
Text Label 3000 1250 0    60   ~ 0
DS_IN
Text Label 3900 1250 2    60   ~ 0
DS_OUT
Text Label 7100 5650 2    60   ~ 0
DS_IN
Text Label 8000 6050 0    60   ~ 0
DS_OUT
Text Label 3300 1350 0    60   ~ 0
SHCP
Text Label 3300 1450 0    60   ~ 0
STCP
Wire Wire Line
	3000 1350 3900 1350
Wire Wire Line
	3900 1450 3000 1450
Text Label 7100 5750 2    60   ~ 0
SHCP
Text Label 7100 5850 2    60   ~ 0
STCP
Text Label 6150 3200 0    60   ~ 0
DS_IN
Text Label 6150 3350 0    60   ~ 0
SHCP
Text Label 6150 3400 0    60   ~ 0
STCP
$Comp
L +3V3 #PWR2
U 1 1 58AB6B00
P 3550 1000
F 0 "#PWR2" H -100 -150 50  0001 C CNN
F 1 "+3V3" H 3565 1173 50  0000 C CNN
F 2 "" H -100 0   50  0000 C CNN
F 3 "" H -100 0   50  0000 C CNN
	1    3550 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1000 3550 1150
Wire Wire Line
	3000 1150 3900 1150
Connection ~ 3550 1150
Wire Wire Line
	3250 700  3250 1050
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
L TPS62152-RESCUE-bigtime IC2
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
P 6650 5000
F 0 "C1" H 6765 5046 50  0000 L CNN
F 1 "100n" H 6765 4955 50  0000 L CNN
F 2 "agg:0603" H 2188 -350 50  0001 C CNN
F 3 "" H 2150 -200 50  0000 C CNN
	1    6650 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6650 5150 7100 5150
$Comp
L GND #PWR13
U 1 1 58AB81EC
P 6650 5150
F 0 "#PWR13" H 2250 -150 50  0001 C CNN
F 1 "GND" H 6655 4977 50  0000 C CNN
F 2 "" H 2250 100 50  0000 C CNN
F 3 "" H 2250 100 50  0000 C CNN
	1    6650 5150
	1    0    0    -1  
$EndComp
Connection ~ 6650 5150
Wire Wire Line
	6650 4850 6900 4850
Wire Wire Line
	6900 4850 6900 5050
Wire Wire Line
	6900 5050 7100 5050
$Comp
L +3V3 #PWR12
U 1 1 58AB83D7
P 6650 4850
F 0 "#PWR12" H 2200 50  50  0001 C CNN
F 1 "+3V3" H 6665 5023 50  0000 C CNN
F 2 "" H 2200 200 50  0000 C CNN
F 3 "" H 2200 200 50  0000 C CNN
	1    6650 4850
	1    0    0    -1  
$EndComp
Connection ~ 6650 4850
Wire Wire Line
	7100 5450 6950 5450
Wire Wire Line
	6950 5450 6950 5150
Connection ~ 6950 5150
Wire Wire Line
	7100 5350 7050 5350
Wire Wire Line
	7050 5350 7050 5050
Connection ~ 7050 5050
$Comp
L SA40-19 U1
U 1 1 58AB8F4C
P 9650 5250
F 0 "U1" H 10078 5308 60  0000 L CNN
F 1 "SA40-19" H 10078 5202 60  0000 L CNN
F 2 "footprints:SA40-18" H 1900 100 60  0001 C CNN
F 3 "" H 1900 100 60  0001 C CNN
	1    9650 5250
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58AC6016
P 8100 5050
F 0 "R1" V 8050 5250 50  0000 C CNN
F 1 "750" V 8100 5050 50  0000 C CNN
F 2 "agg:0603" V 2130 1250 50  0001 C CNN
F 3 "" H 2200 1250 50  0001 C CNN
	1    8100 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 5950 7950 5950
Wire Wire Line
	7950 5950 7950 6050
Wire Wire Line
	7950 6050 8000 6050
Wire Wire Line
	7900 5050 7950 5050
Wire Wire Line
	8250 5050 8950 5050
Wire Wire Line
	7900 5150 8300 5150
Wire Wire Line
	8600 5150 8950 5150
Wire Wire Line
	7900 5250 7950 5250
Wire Wire Line
	8250 5250 8950 5250
Wire Wire Line
	7900 5350 8300 5350
Wire Wire Line
	8600 5350 8950 5350
Wire Wire Line
	7900 5450 7950 5450
Wire Wire Line
	8250 5450 8950 5450
Wire Wire Line
	7900 5550 8300 5550
Wire Wire Line
	8600 5550 8950 5550
Wire Wire Line
	7900 5650 7950 5650
Wire Wire Line
	8250 5650 8950 5650
Wire Wire Line
	7900 5750 8200 5750
$Comp
L PART X1
U 1 1 58AC7EDC
P 1050 6700
F 0 "X1" H 1578 6796 50  0000 L CNN
F 1 "MOUNTING_HOLE" H 1578 6705 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -1950 -550 50  0001 C CNN
F 3 "" H -1950 -550 50  0001 C CNN
	1    1050 6700
	1    0    0    -1  
$EndComp
$Comp
L PART X2
U 1 1 58AC8280
P 1050 6900
F 0 "X2" H 1578 6996 50  0000 L CNN
F 1 "MOUNTING_HOLE" H 1578 6905 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -1950 -350 50  0001 C CNN
F 3 "" H -1950 -350 50  0001 C CNN
	1    1050 6900
	1    0    0    -1  
$EndComp
$Comp
L PART X3
U 1 1 58AC82C0
P 1050 7100
F 0 "X3" H 1578 7196 50  0000 L CNN
F 1 "MOUNTING_HOLE" H 1578 7105 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -1950 -150 50  0001 C CNN
F 3 "" H -1950 -150 50  0001 C CNN
	1    1050 7100
	1    0    0    -1  
$EndComp
$Comp
L PART X4
U 1 1 58AC82FE
P 1050 7300
F 0 "X4" H 1578 7396 50  0000 L CNN
F 1 "MOUNTING_HOLE" H 1578 7305 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -1950 50  50  0001 C CNN
F 3 "" H -1950 50  50  0001 C CNN
	1    1050 7300
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58B70876
P 8450 5150
F 0 "R?" V 8400 5350 50  0000 C CNN
F 1 "750" V 8450 5150 50  0000 C CNN
F 2 "agg:0603" V 2480 1350 50  0001 C CNN
F 3 "" H 2550 1350 50  0001 C CNN
	1    8450 5150
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58B708B4
P 8100 5250
F 0 "R?" V 8050 5450 50  0000 C CNN
F 1 "750" V 8100 5250 50  0000 C CNN
F 2 "agg:0603" V 2130 1450 50  0001 C CNN
F 3 "" H 2200 1450 50  0001 C CNN
	1    8100 5250
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58B708F8
P 8450 5350
F 0 "R?" V 8400 5550 50  0000 C CNN
F 1 "750" V 8450 5350 50  0000 C CNN
F 2 "agg:0603" V 2480 1550 50  0001 C CNN
F 3 "" H 2550 1550 50  0001 C CNN
	1    8450 5350
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58B7093A
P 8100 5450
F 0 "R?" V 8050 5650 50  0000 C CNN
F 1 "750" V 8100 5450 50  0000 C CNN
F 2 "agg:0603" V 2130 1650 50  0001 C CNN
F 3 "" H 2200 1650 50  0001 C CNN
	1    8100 5450
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58B7097E
P 8450 5550
F 0 "R?" V 8400 5750 50  0000 C CNN
F 1 "750" V 8450 5550 50  0000 C CNN
F 2 "agg:0603" V 2480 1750 50  0001 C CNN
F 3 "" H 2550 1750 50  0001 C CNN
	1    8450 5550
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58B709C6
P 8100 5650
F 0 "R?" V 8050 5850 50  0000 C CNN
F 1 "750" V 8100 5650 50  0000 C CNN
F 2 "agg:0603" V 2130 1850 50  0001 C CNN
F 3 "" H 2200 1850 50  0001 C CNN
	1    8100 5650
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58B70A14
P 8350 5750
F 0 "R?" V 8300 5950 50  0000 C CNN
F 1 "750" V 8350 5750 50  0000 C CNN
F 2 "agg:0603" V 2380 1950 50  0001 C CNN
F 3 "" H 2450 1950 50  0001 C CNN
	1    8350 5750
	0    1    1    0   
$EndComp
$Comp
L D_Zener_Small D?
U 1 1 58B70BEE
P 8800 5750
F 0 "D?" H 8900 5850 50  0000 C CNN
F 1 "3.9V" H 8700 5850 50  0000 C CNN
F 2 "" V -50 -200 50  0001 C CNN
F 3 "" V -50 -200 50  0001 C CNN
	1    8800 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8500 5750 8700 5750
Wire Wire Line
	8900 5750 8950 5750
$Comp
L LM317_SOT223 U?
U 1 1 58B71899
P 7800 3750
F 0 "U?" H 7800 4165 50  0000 C CNN
F 1 "LM317_SOT223" H 7800 4074 50  0000 C CNN
F 2 "" H -200 -250 50  0001 C CNN
F 3 "" H -200 -250 50  0001 C CNN
	1    7800 3750
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR?
U 1 1 58B71B7B
P 7350 3550
F 0 "#PWR?" H 7400 3600 50  0001 C CNN
F 1 "+12V" H 7365 3723 50  0000 C CNN
F 2 "" H -750 -350 50  0001 C CNN
F 3 "" H -750 -350 50  0001 C CNN
	1    7350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3550 7350 3650
Wire Wire Line
	7350 3600 7400 3600
Wire Wire Line
	8200 3600 8900 3600
Wire Wire Line
	8900 4750 8950 4750
Wire Wire Line
	8900 4850 8950 4850
Connection ~ 8900 4750
$Comp
L C C?
U 1 1 58B7225C
P 7350 3800
F 0 "C?" H 7235 3754 50  0000 R CNN
F 1 "C" H 7235 3845 50  0000 R CNN
F 2 "" H 388 -100 50  0001 C CNN
F 3 "" H 350 50  50  0001 C CNN
	1    7350 3800
	-1   0    0    1   
$EndComp
Connection ~ 7350 3600
$Comp
L GND #PWR?
U 1 1 58B72373
P 7350 3950
F 0 "#PWR?" H 7400 4000 50  0001 C CNN
F 1 "GND" H 7355 3777 50  0000 C CNN
F 2 "" H -200 -200 50  0001 C CNN
F 3 "" H -200 -200 50  0001 C CNN
	1    7350 3950
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58B723D5
P 8250 3800
F 0 "C?" H 8365 3846 50  0000 L CNN
F 1 "C" H 8365 3755 50  0000 L CNN
F 2 "" H 738 -550 50  0001 C CNN
F 3 "" H 700 -400 50  0001 C CNN
	1    8250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3650 8250 3600
Connection ~ 8250 3600
$Comp
L GND #PWR?
U 1 1 58B72502
P 8250 3950
F 0 "#PWR?" H 8300 4000 50  0001 C CNN
F 1 "GND" H 8255 3777 50  0000 C CNN
F 2 "" H -200 -50 50  0001 C CNN
F 3 "" H -200 -50 50  0001 C CNN
	1    8250 3950
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58B72566
P 8550 3850
F 0 "R?" H 8620 3896 50  0000 L CNN
F 1 "380k" H 8620 3805 50  0000 L CNN
F 2 "" V -220 -200 50  0001 C CNN
F 3 "" H -150 -200 50  0001 C CNN
	1    8550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3700 8550 3600
Connection ~ 8550 3600
$Comp
L POT-RESCUE-bigtime RV?
U 1 1 58B7266E
P 8550 4200
F 0 "RV?" H 8480 4154 50  0000 R CNN
F 1 "100k" H 8480 4245 50  0000 R CNN
F 2 "" H -150 500 50  0001 C CNN
F 3 "" H -150 500 50  0001 C CNN
	1    8550 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	8550 4050 8550 4000
$Comp
L R R?
U 1 1 58B727F2
P 8550 4550
F 0 "R?" H 8620 4596 50  0000 L CNN
F 1 "0" H 8620 4505 50  0000 L CNN
F 2 "" V -120 0   50  0001 C CNN
F 3 "" H -50 0   50  0001 C CNN
	1    8550 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 58B7299B
P 8550 4700
F 0 "#PWR?" H 8600 4750 50  0001 C CNN
F 1 "GND" H 8555 4527 50  0000 C CNN
F 2 "" H -550 850 50  0001 C CNN
F 3 "" H -550 850 50  0001 C CNN
	1    8550 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4400 8550 4350
Wire Wire Line
	8400 4200 7800 4200
Wire Wire Line
	7800 4200 7800 4100
Wire Wire Line
	8900 3600 8900 4850
Text Label 8900 3600 0    60   ~ 0
V_LED_BUS
Text Label 3250 700  0    60   ~ 0
V_LED_BUS
Text Notes 7800 4300 0    60   ~ 0
1.25V
Text Notes 8750 3500 0    60   ~ 0
160mA nominal
$Sheet
S 4150 3400 850  1400
U 58B736A9
F0 "ethernet" 60
F1 "ethernet.sch" 60
$EndSheet
$EndSCHEMATC
