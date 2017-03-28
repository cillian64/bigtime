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
LIBS:max5969x
LIBS:max17503
LIBS:stm32f4xxvxtx
LIBS:smd_xtal
LIBS:swd
LIBS:swd_tc
LIBS:25aa02e48
LIBS:microusb
LIBS:ldl212dr
LIBS:bigtime-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 9100 1550 2    60   Output ~ 0
RXD1
Text HLabel 9100 1650 2    60   Output ~ 0
RXD0
Text HLabel 9100 1750 2    60   Output ~ 0
CRS_DV
Text HLabel 9100 1850 2    60   Output ~ 0
REF_CLK
Text HLabel 9100 2050 2    60   Input ~ 0
TXEN
Text HLabel 9100 2250 2    60   Input ~ 0
TXD1
Text HLabel 9100 2150 2    60   Input ~ 0
TXD0
Text HLabel 9100 2450 2    60   BiDi ~ 0
MDIO
Text HLabel 9100 2550 2    60   Input ~ 0
MDC
$Comp
L RJ45_LEDS J1
U 1 1 58B737CA
P 2000 2250
F 0 "J1" V 2615 2250 50  0000 C CNN
F 1 "RJ45_LEDS" V 2524 2250 50  0000 C CNN
F 2 "Connect:RJHSE538X" H 0   400 50  0001 C CNN
F 3 "" H 0   400 50  0000 C CNN
	1    2000 2250
	0    -1   -1   0   
$EndComp
$Comp
L 749010012A T1
U 1 1 58B9E647
P 4650 2550
F 0 "T1" H 4650 3275 50  0000 C CNN
F 1 "749010012A" H 4650 3184 50  0000 C CNN
F 2 "agg:749010012A" H 4450 1850 50  0001 L CNN
F 3 "http://katalog.we-online.de/pbs/datasheet/749010012A.pdf" H 4450 1750 50  0001 L CNN
F 4 "2422552" H 4450 1650 50  0001 L CNN "Farnell"
	1    4650 2550
	1    0    0    -1  
$EndComp
$Comp
L KSZ8081RNx IC5
U 1 1 58B9E67D
P 8050 2350
F 0 "IC5" H 8050 3375 50  0000 C CNN
F 1 "KSZ8081RNx" H 8050 3284 50  0000 C CNN
F 2 "agg:QFN-24-EP-MICREL" H 7550 1350 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/KSZ8081RNA_RND.pdf" H 7550 1250 50  0001 L CNN
F 4 "2509802" H 7550 1150 50  0001 L CNN "Farnell"
	1    8050 2350
	1    0    0    -1  
$EndComp
$Comp
L MAX5969x IC6
U 1 1 58B9E763
P 4300 5100
F 0 "IC6" H 4300 5725 50  0000 C CNN
F 1 "MAX5969x" H 4300 5634 50  0000 C CNN
F 2 "agg:DFN-10-EP-MAX" H 4000 4500 50  0001 L CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX5969A-MAX5969B.pdf" H 4000 4400 50  0001 L CNN
F 4 "2514586" H 4000 4300 50  0001 L CNN "Farnell"
	1    4300 5100
	1    0    0    -1  
$EndComp
$Comp
L MAX17503 IC7
U 1 1 58B9E79F
P 7250 5300
F 0 "IC7" H 7250 6225 50  0000 C CNN
F 1 "MAX17503" H 7250 6134 50  0000 C CNN
F 2 "agg:QFN-20-EP-MAX" H 6850 4400 50  0001 L CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX17503.pdf" H 6850 4300 50  0001 L CNN
F 4 "2514229" H 6850 4200 50  0001 L CNN "Farnell"
	1    7250 5300
	1    0    0    -1  
$EndComp
Text HLabel 1450 2500 0    60   Input ~ 0
TRAFFIC_LED
$Comp
L +3V3 #PWR51
U 1 1 58B9F15A
P 850 2850
F 0 "#PWR51" H 850 2700 50  0001 C CNN
F 1 "+3V3" H 865 3023 50  0000 C CNN
F 2 "" H 850 2850 50  0000 C CNN
F 3 "" H 850 2850 50  0000 C CNN
	1    850  2850
	1    0    0    -1  
$EndComp
Text Label 1450 1800 2    60   ~ 0
LINK_LED
$Comp
L +3V3 #PWR44
U 1 1 58B9F35C
P 850 2100
F 0 "#PWR44" H 850 1950 50  0001 C CNN
F 1 "+3V3" H 865 2273 50  0000 C CNN
F 2 "" H 850 2100 50  0000 C CNN
F 3 "" H 850 2100 50  0000 C CNN
	1    850  2100
	1    0    0    -1  
$EndComp
Text Label 2750 1900 0    60   ~ 0
VB1
$Comp
L C C29
U 1 1 58B9F568
P 2750 3000
F 0 "C29" H 2800 3100 50  0000 L CNN
F 1 "10n 200V" V 2600 2800 50  0000 L CNN
F 2 "agg:0805" H 2788 2850 50  0001 C CNN
F 3 "" H 2750 3000 50  0000 C CNN
	1    2750 3000
	1    0    0    -1  
$EndComp
Text Label 3150 2250 0    60   ~ 0
VB2
$Comp
L R R20
U 1 1 58B9FEC9
P 2750 3300
F 0 "R20" H 2820 3346 50  0000 L CNN
F 1 "75" H 2820 3255 50  0000 L CNN
F 2 "agg:0603" V 2680 3300 50  0001 C CNN
F 3 "" H 2750 3300 50  0000 C CNN
	1    2750 3300
	1    0    0    -1  
$EndComp
$Comp
L C C33
U 1 1 58BA0422
P 5250 3000
F 0 "C33" H 5365 3046 50  0000 L CNN
F 1 "100n" H 5365 2955 50  0000 L CNN
F 2 "agg:0603" H 5288 2850 50  0001 C CNN
F 3 "" H 5250 3000 50  0000 C CNN
	1    5250 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR52
U 1 1 58BA0647
P 5250 3150
F 0 "#PWR52" H 5250 2900 50  0001 C CNN
F 1 "GND" H 5255 2977 50  0000 C CNN
F 2 "" H 5250 3150 50  0000 C CNN
F 3 "" H 5250 3150 50  0000 C CNN
	1    5250 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR53
U 1 1 58BA068E
P 5650 3150
F 0 "#PWR53" H 5650 2900 50  0001 C CNN
F 1 "GND" H 5655 2977 50  0000 C CNN
F 2 "" H 5650 3150 50  0000 C CNN
F 3 "" H 5650 3150 50  0000 C CNN
	1    5650 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR47
U 1 1 58BA115A
P 7350 2150
F 0 "#PWR47" H 7350 1900 50  0001 C CNN
F 1 "GND" H 7355 1977 50  0001 C CNN
F 2 "" H 7350 2150 50  0000 C CNN
F 3 "" H 7350 2150 50  0000 C CNN
	1    7350 2150
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y2
U 1 1 58BA12EF
P 6600 2900
F 0 "Y2" V 6646 2769 50  0000 R CNN
F 1 "25MHz" V 6555 2769 50  0000 R CNN
F 2 "agg:XTAL-50x32" H 6600 2900 50  0001 C CNN
F 3 "" H 6600 2900 50  0000 C CNN
	1    6600 2900
	0    -1   -1   0   
$EndComp
$Comp
L C C36
U 1 1 58BA1404
P 6900 3350
F 0 "C36" H 7015 3396 50  0000 L CNN
F 1 "30p" H 7015 3305 50  0000 L CNN
F 2 "agg:0603" H 6938 3200 50  0001 C CNN
F 3 "" H 6900 3350 50  0000 C CNN
	1    6900 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR55
U 1 1 58BA1640
P 6900 3500
F 0 "#PWR55" H 6900 3250 50  0001 C CNN
F 1 "GND" H 6905 3327 50  0000 C CNN
F 2 "" H 6900 3500 50  0000 C CNN
F 3 "" H 6900 3500 50  0000 C CNN
	1    6900 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR56
U 1 1 58BA1690
P 7300 3500
F 0 "#PWR56" H 7300 3250 50  0001 C CNN
F 1 "GND" H 7305 3327 50  0000 C CNN
F 2 "" H 7300 3500 50  0000 C CNN
F 3 "" H 7300 3500 50  0000 C CNN
	1    7300 3500
	1    0    0    -1  
$EndComp
$Comp
L C C27
U 1 1 58BA19C8
P 6500 2000
F 0 "C27" H 6615 2046 50  0000 L CNN
F 1 "2u2" H 6615 1955 50  0000 L CNN
F 2 "agg:0603" H 6538 1850 50  0001 C CNN
F 3 "" H 6500 2000 50  0000 C CNN
	1    6500 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR45
U 1 1 58BA1A5E
P 6500 2150
F 0 "#PWR45" H 6500 1900 50  0001 C CNN
F 1 "GND" H 6505 1977 50  0001 C CNN
F 2 "" H 6500 2150 50  0000 C CNN
F 3 "" H 6500 2150 50  0000 C CNN
	1    6500 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR46
U 1 1 58BA1AB4
P 6950 2150
F 0 "#PWR46" H 6950 1900 50  0001 C CNN
F 1 "GND" H 6955 1977 50  0001 C CNN
F 2 "" H 6950 2150 50  0000 C CNN
F 3 "" H 6950 2150 50  0000 C CNN
	1    6950 2150
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR39
U 1 1 58BA1E02
P 6050 750
F 0 "#PWR39" H 6050 600 50  0001 C CNN
F 1 "+3V3" H 6065 923 50  0000 C CNN
F 2 "" H 6050 750 50  0000 C CNN
F 3 "" H 6050 750 50  0000 C CNN
	1    6050 750 
	1    0    0    -1  
$EndComp
$Comp
L L_Small L2
U 1 1 58BA1F42
P 6250 850
F 0 "L2" V 6072 850 50  0000 C CNN
F 1 "FB" V 6163 850 50  0000 C CNN
F 2 "agg:0603" H 6250 850 50  0001 C CNN
F 3 "" H 6250 850 50  0000 C CNN
	1    6250 850 
	0    1    1    0   
$EndComp
$Comp
L C C28
U 1 1 58BA264B
P 6950 2000
F 0 "C28" H 7065 2046 50  0000 L CNN
F 1 "100n" H 7065 1955 50  0000 L CNN
F 2 "agg:0603" H 6988 1850 50  0001 C CNN
F 3 "" H 6950 2000 50  0000 C CNN
	1    6950 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR40
U 1 1 58BA48D5
P 6450 1150
F 0 "#PWR40" H 6450 900 50  0001 C CNN
F 1 "GND" H 6455 977 50  0001 C CNN
F 2 "" H 6450 1150 50  0000 C CNN
F 3 "" H 6450 1150 50  0000 C CNN
	1    6450 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR41
U 1 1 58BA492B
P 6850 1150
F 0 "#PWR41" H 6850 900 50  0001 C CNN
F 1 "GND" H 6855 977 50  0001 C CNN
F 2 "" H 6850 1150 50  0000 C CNN
F 3 "" H 6850 1150 50  0000 C CNN
	1    6850 1150
	1    0    0    -1  
$EndComp
$Comp
L C C25
U 1 1 58BA4983
P 6450 1550
F 0 "C25" H 6565 1596 50  0000 L CNN
F 1 "22u" H 6565 1505 50  0000 L CNN
F 2 "agg:1206" H 6488 1400 50  0001 C CNN
F 3 "" H 6450 1550 50  0000 C CNN
	1    6450 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR42
U 1 1 58BA4B25
P 6450 1700
F 0 "#PWR42" H 6450 1450 50  0001 C CNN
F 1 "GND" H 6455 1527 50  0001 C CNN
F 2 "" H 6450 1700 50  0000 C CNN
F 3 "" H 6450 1700 50  0000 C CNN
	1    6450 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR43
U 1 1 58BA4BE5
P 6850 1700
F 0 "#PWR43" H 6850 1450 50  0001 C CNN
F 1 "GND" H 6855 1527 50  0001 C CNN
F 2 "" H 6850 1700 50  0000 C CNN
F 3 "" H 6850 1700 50  0000 C CNN
	1    6850 1700
	1    0    0    -1  
$EndComp
$Comp
L R_Small R11
U 1 1 58BA5DEC
P 8800 1550
F 0 "R11" V 8750 1700 50  0000 C CNN
F 1 "33" V 8800 1550 50  0000 C CNN
F 2 "agg:0603" H 8800 1550 50  0001 C CNN
F 3 "" H 8800 1550 50  0000 C CNN
	1    8800 1550
	0    1    1    0   
$EndComp
NoConn ~ 8650 1950
$Comp
L R_Small R16
U 1 1 58BA76A9
P 9550 2250
F 0 "R16" H 9609 2296 50  0000 L CNN
F 1 "1k" H 9609 2205 50  0000 L CNN
F 2 "agg:0603" H 9550 2250 50  0001 C CNN
F 3 "" H 9550 2250 50  0000 C CNN
	1    9550 2250
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR48
U 1 1 58BA8C0B
P 9550 2150
F 0 "#PWR48" H 9550 2000 50  0001 C CNN
F 1 "+3V3" H 9565 2323 50  0000 C CNN
F 2 "" H 9550 2150 50  0000 C CNN
F 3 "" H 9550 2150 50  0000 C CNN
	1    9550 2150
	1    0    0    -1  
$EndComp
Text Label 8650 2950 0    60   ~ 0
LINK_LED
NoConn ~ 8650 2850
$Comp
L R R17
U 1 1 58BABB2D
P 9550 2750
F 0 "R17" V 9757 2750 50  0000 C CNN
F 1 "6k49" V 9666 2750 50  0000 C CNN
F 2 "agg:0603" V 9480 2750 50  0001 C CNN
F 3 "" H 9550 2750 50  0000 C CNN
	1    9550 2750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR50
U 1 1 58BABD3E
P 9700 2800
F 0 "#PWR50" H 9700 2550 50  0001 C CNN
F 1 "GND" H 9705 2627 50  0000 C CNN
F 2 "" H 9700 2800 50  0000 C CNN
F 3 "" H 9700 2800 50  0000 C CNN
	1    9700 2800
	1    0    0    -1  
$EndComp
$Comp
L C C35
U 1 1 58BAC526
P 10200 3200
F 0 "C35" H 10315 3246 50  0000 L CNN
F 1 "C" H 10315 3155 50  0000 L CNN
F 2 "agg:0603" H 10238 3050 50  0001 C CNN
F 3 "" H 10200 3200 50  0000 C CNN
	1    10200 3200
	1    0    0    -1  
$EndComp
$Comp
L D D2
U 1 1 58BAC66A
P 9950 2900
F 0 "D2" V 9904 2978 50  0000 L CNN
F 1 "1N4148" V 9995 2978 50  0000 L CNN
F 2 "agg:SOD-323" H 9950 2900 50  0001 C CNN
F 3 "" H 9950 2900 50  0000 C CNN
	1    9950 2900
	0    1    1    0   
$EndComp
$Comp
L R R19
U 1 1 58BAC8A4
P 10450 2900
F 0 "R19" H 10520 2946 50  0000 L CNN
F 1 "10k" H 10520 2855 50  0000 L CNN
F 2 "agg:0603" V 10380 2900 50  0001 C CNN
F 3 "" H 10450 2900 50  0000 C CNN
	1    10450 2900
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR49
U 1 1 58BAD620
P 10200 2600
F 0 "#PWR49" H 10200 2450 50  0001 C CNN
F 1 "+3V3" H 10215 2773 50  0000 C CNN
F 2 "" H 10200 2600 50  0000 C CNN
F 3 "" H 10200 2600 50  0000 C CNN
	1    10200 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR54
U 1 1 58BAD7C0
P 10200 3350
F 0 "#PWR54" H 10200 3100 50  0001 C CNN
F 1 "GND" H 10205 3177 50  0000 C CNN
F 2 "" H 10200 3350 50  0000 C CNN
F 3 "" H 10200 3350 50  0000 C CNN
	1    10200 3350
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 58BB03BC
P 1200 2100
F 0 "R15" V 1407 2100 50  0000 C CNN
F 1 "1k" V 1316 2100 50  0000 C CNN
F 2 "agg:0603" V 1130 2100 50  0001 C CNN
F 3 "" H 1200 2100 50  0000 C CNN
	1    1200 2100
	0    -1   -1   0   
$EndComp
$Comp
L R R18
U 1 1 58BB1419
P 1200 2850
F 0 "R18" V 993 2850 50  0000 C CNN
F 1 "1k" V 1084 2850 50  0000 C CNN
F 2 "agg:0603" V 1130 2850 50  0001 C CNN
F 3 "" H 1200 2850 50  0000 C CNN
	1    1200 2850
	0    1    1    0   
$EndComp
$Comp
L C C30
U 1 1 58BB3AF6
P 3150 3000
F 0 "C30" H 3200 3100 50  0000 L CNN
F 1 "10n 200V" V 3000 2800 50  0000 L CNN
F 2 "agg:0805" H 3188 2850 50  0001 C CNN
F 3 "" H 3150 3000 50  0000 C CNN
	1    3150 3000
	1    0    0    -1  
$EndComp
$Comp
L C C31
U 1 1 58BB3B78
P 3550 3000
F 0 "C31" H 3600 3100 50  0000 L CNN
F 1 "10n 200V" V 3400 2800 50  0000 L CNN
F 2 "agg:0805" H 3588 2850 50  0001 C CNN
F 3 "" H 3550 3000 50  0000 C CNN
	1    3550 3000
	1    0    0    -1  
$EndComp
$Comp
L C C32
U 1 1 58BB3BFD
P 3950 3000
F 0 "C32" H 4000 3100 50  0000 L CNN
F 1 "10n 200V" V 3800 2800 50  0000 L CNN
F 2 "agg:0805" H 3988 2850 50  0001 C CNN
F 3 "" H 3950 3000 50  0000 C CNN
	1    3950 3000
	1    0    0    -1  
$EndComp
$Comp
L R R21
U 1 1 58BB4623
P 3150 3300
F 0 "R21" H 3220 3346 50  0000 L CNN
F 1 "75" H 3220 3255 50  0000 L CNN
F 2 "agg:0603" V 3080 3300 50  0001 C CNN
F 3 "" H 3150 3300 50  0000 C CNN
	1    3150 3300
	1    0    0    -1  
$EndComp
$Comp
L R R22
U 1 1 58BB46A8
P 3550 3300
F 0 "R22" H 3620 3346 50  0000 L CNN
F 1 "75" H 3620 3255 50  0000 L CNN
F 2 "agg:0603" V 3480 3300 50  0001 C CNN
F 3 "" H 3550 3300 50  0000 C CNN
	1    3550 3300
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 58BB472B
P 3950 3300
F 0 "R23" H 4020 3346 50  0000 L CNN
F 1 "75" H 4020 3255 50  0000 L CNN
F 2 "agg:0603" V 3880 3300 50  0001 C CNN
F 3 "" H 3950 3300 50  0000 C CNN
	1    3950 3300
	1    0    0    -1  
$EndComp
$Comp
L C C34
U 1 1 58BB53AE
P 5650 3000
F 0 "C34" H 5765 3046 50  0000 L CNN
F 1 "100n" H 5765 2955 50  0000 L CNN
F 2 "agg:0603" H 5688 2850 50  0001 C CNN
F 3 "" H 5650 3000 50  0000 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
$Comp
L C C37
U 1 1 58BB5BD5
P 7300 3350
F 0 "C37" H 7415 3396 50  0000 L CNN
F 1 "30p" H 7415 3305 50  0000 L CNN
F 2 "agg:0603" H 7338 3200 50  0001 C CNN
F 3 "" H 7300 3350 50  0000 C CNN
	1    7300 3350
	1    0    0    -1  
$EndComp
$Comp
L C C26
U 1 1 58BB6676
P 6850 1550
F 0 "C26" H 6965 1596 50  0000 L CNN
F 1 "100n" H 6965 1505 50  0000 L CNN
F 2 "agg:0603" H 6888 1400 50  0001 C CNN
F 3 "" H 6850 1550 50  0000 C CNN
	1    6850 1550
	1    0    0    -1  
$EndComp
$Comp
L C C24
U 1 1 58BB66F7
P 6850 1000
F 0 "C24" H 6965 1046 50  0000 L CNN
F 1 "100n" H 6965 955 50  0000 L CNN
F 2 "agg:0603" H 6888 850 50  0001 C CNN
F 3 "" H 6850 1000 50  0000 C CNN
	1    6850 1000
	1    0    0    -1  
$EndComp
$Comp
L C C23
U 1 1 58BB681D
P 6450 1000
F 0 "C23" H 6565 1046 50  0000 L CNN
F 1 "22u" H 6565 955 50  0000 L CNN
F 2 "agg:1206" H 6488 850 50  0001 C CNN
F 3 "" H 6450 1000 50  0000 C CNN
	1    6450 1000
	1    0    0    -1  
$EndComp
$Comp
L R_Small R12
U 1 1 58BB77E1
P 8800 1650
F 0 "R12" V 8750 1800 50  0000 C CNN
F 1 "33" V 8800 1650 50  0000 C CNN
F 2 "agg:0603" H 8800 1650 50  0001 C CNN
F 3 "" H 8800 1650 50  0000 C CNN
	1    8800 1650
	0    1    1    0   
$EndComp
$Comp
L R_Small R13
U 1 1 58BB7857
P 8800 1750
F 0 "R13" V 8750 1900 50  0000 C CNN
F 1 "33" V 8800 1750 50  0000 C CNN
F 2 "agg:0603" H 8800 1750 50  0001 C CNN
F 3 "" H 8800 1750 50  0000 C CNN
	1    8800 1750
	0    1    1    0   
$EndComp
$Comp
L R_Small R14
U 1 1 58BB78D0
P 8800 1850
F 0 "R14" V 8750 2000 50  0000 C CNN
F 1 "33" V 8800 1850 50  0000 C CNN
F 2 "agg:0603" H 8800 1850 50  0001 C CNN
F 3 "" H 8800 1850 50  0000 C CNN
	1    8800 1850
	0    1    1    0   
$EndComp
$Comp
L D D3
U 1 1 58BB8CE6
P 1200 4850
F 0 "D3" V 1200 4928 50  0000 L CNN
F 1 "SS110B" V 1245 4928 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 1200 4973 50  0001 C CNN
F 3 "" H 1200 4850 50  0000 C CNN
	1    1200 4850
	0    1    1    0   
$EndComp
$Comp
L D D8
U 1 1 58BB96F8
P 1200 5250
F 0 "D8" V 1200 5328 50  0000 L CNN
F 1 "SS110B" V 1245 5328 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 1200 5373 50  0001 C CNN
F 3 "" H 1200 5250 50  0000 C CNN
	1    1200 5250
	0    1    1    0   
$EndComp
$Comp
L D D4
U 1 1 58BB9780
P 1500 4850
F 0 "D4" V 1500 4928 50  0000 L CNN
F 1 "SS110B" V 1545 4928 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 1500 4973 50  0001 C CNN
F 3 "" H 1500 4850 50  0000 C CNN
	1    1500 4850
	0    1    1    0   
$EndComp
$Comp
L D D9
U 1 1 58BB980F
P 1500 5250
F 0 "D9" V 1500 5328 50  0000 L CNN
F 1 "SS110B" V 1545 5328 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 1500 5373 50  0001 C CNN
F 3 "" H 1500 5250 50  0000 C CNN
	1    1500 5250
	0    1    1    0   
$EndComp
Text Label 1150 5050 2    60   ~ 0
VA1
Text Label 1450 5050 2    60   ~ 0
VA2
$Comp
L D D5
U 1 1 58BBA5EB
P 1800 4850
F 0 "D5" V 1800 4928 50  0000 L CNN
F 1 "SS110B" V 1845 4928 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 1800 4973 50  0001 C CNN
F 3 "" H 1800 4850 50  0000 C CNN
	1    1800 4850
	0    1    1    0   
$EndComp
$Comp
L D D10
U 1 1 58BBA678
P 1800 5250
F 0 "D10" V 1800 5328 50  0000 L CNN
F 1 "SS110B" V 1845 5328 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 1800 5373 50  0001 C CNN
F 3 "" H 1800 5250 50  0000 C CNN
	1    1800 5250
	0    1    1    0   
$EndComp
Text Label 1750 5050 2    60   ~ 0
VB1
Text Label 2050 5050 2    60   ~ 0
VB2
$Comp
L D D6
U 1 1 58BBA8AE
P 2100 4850
F 0 "D6" V 2100 4928 50  0000 L CNN
F 1 "SS110B" V 2145 4928 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 2100 4973 50  0001 C CNN
F 3 "" H 2100 4850 50  0000 C CNN
	1    2100 4850
	0    1    1    0   
$EndComp
$Comp
L D D11
U 1 1 58BBA943
P 2100 5250
F 0 "D11" V 2100 5328 50  0000 L CNN
F 1 "SS110B" V 2145 5328 50  0001 L CNN
F 2 "agg:DO-214AA-SMB" H 2100 5373 50  0001 C CNN
F 3 "" H 2100 5250 50  0000 C CNN
	1    2100 5250
	0    1    1    0   
$EndComp
$Comp
L ZENERsmall D7
U 1 1 58BBC38A
P 2450 5100
F 0 "D7" V 2450 5169 50  0000 L CNN
F 1 "SMAJ58A" H 2450 5215 50  0001 C CNN
F 2 "agg:DO-214AC-SMA" H 2450 5100 50  0001 C CNN
F 3 "" H 2450 5100 50  0000 C CNN
	1    2450 5100
	0    1    1    0   
$EndComp
$Comp
L R_Small R25
U 1 1 58BBE814
P 3750 5100
F 0 "R25" V 3650 5000 50  0000 C CNN
F 1 "24k9" V 3650 5200 50  0000 C CNN
F 2 "agg:0603" H 3750 5100 50  0001 C CNN
F 3 "" H 3750 5100 50  0000 C CNN
	1    3750 5100
	0    1    1    0   
$EndComp
$Comp
L R_Small R26
U 1 1 58BBE8F7
P 3750 5200
F 0 "R26" V 3850 5100 50  0000 C CNN
F 1 "619" V 3850 5300 50  0000 C CNN
F 2 "agg:0603" H 3750 5200 50  0001 C CNN
F 3 "" H 3750 5200 50  0000 C CNN
	1    3750 5200
	0    1    1    0   
$EndComp
$Comp
L INDUCTOR L4
U 1 1 58BC305E
P 8500 5000
F 0 "L4" V 8322 5000 50  0000 C CNN
F 1 "22u" V 8413 5000 50  0000 C CNN
F 2 "footprints:SRR1260A" H 8500 5000 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1914016.pdf" H 8500 5000 50  0001 C CNN
F 4 "1929699" H 8500 5000 60  0001 C CNN "Farnell"
	1    8500 5000
	0    1    1    0   
$EndComp
NoConn ~ 4700 4700
$Comp
L GND #PWR61
U 1 1 58BC4A36
P 4800 5300
F 0 "#PWR61" H 4800 5050 50  0001 C CNN
F 1 "GND" H 4805 5127 50  0000 C CNN
F 2 "" H 4800 5300 50  0000 C CNN
F 3 "" H 4800 5300 50  0000 C CNN
	1    4800 5300
	1    0    0    -1  
$EndComp
$Comp
L C C38
U 1 1 58BC71FE
P 6400 4450
F 0 "C38" H 6450 4550 50  0000 L CNN
F 1 "2u2 60V" H 6450 4350 50  0000 L CNN
F 2 "agg:1210" H 6438 4300 50  0001 C CNN
F 3 "" H 6400 4450 50  0000 C CNN
	1    6400 4450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR57
U 1 1 58BC73C0
P 6400 4600
F 0 "#PWR57" H 6400 4350 50  0001 C CNN
F 1 "GND" H 6405 4427 50  0000 C CNN
F 2 "" H 6400 4600 50  0000 C CNN
F 3 "" H 6400 4600 50  0000 C CNN
	1    6400 4600
	1    0    0    -1  
$EndComp
$Comp
L R_Small R24
U 1 1 58BC772F
P 5900 4750
F 0 "R24" H 5959 4796 50  0000 L CNN
F 1 "3M3" H 5959 4705 50  0000 L CNN
F 2 "agg:0603" H 5900 4750 50  0001 C CNN
F 3 "" H 5900 4750 50  0000 C CNN
	1    5900 4750
	1    0    0    -1  
$EndComp
NoConn ~ 6750 5100
$Comp
L GND #PWR60
U 1 1 58BC9E72
P 6700 5200
F 0 "#PWR60" H 6700 4950 50  0001 C CNN
F 1 "GND" H 6705 5027 50  0001 C CNN
F 2 "" H 6700 5200 50  0000 C CNN
F 3 "" H 6700 5200 50  0000 C CNN
	1    6700 5200
	1    0    0    -1  
$EndComp
$Comp
L C C42
U 1 1 58BCA06E
P 6200 5550
F 0 "C42" H 6315 5596 50  0000 L CNN
F 1 "1n" H 6315 5505 50  0000 L CNN
F 2 "agg:0603" H 6238 5400 50  0001 C CNN
F 3 "" H 6200 5550 50  0000 C CNN
	1    6200 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR63
U 1 1 58BCA458
P 6200 5700
F 0 "#PWR63" H 6200 5450 50  0001 C CNN
F 1 "GND" H 6205 5527 50  0000 C CNN
F 2 "" H 6200 5700 50  0000 C CNN
F 3 "" H 6200 5700 50  0000 C CNN
	1    6200 5700
	1    0    0    -1  
$EndComp
NoConn ~ 6750 5500
$Comp
L GND #PWR64
U 1 1 58BCAA6F
P 6650 6050
F 0 "#PWR64" H 6650 5800 50  0001 C CNN
F 1 "GND" H 6655 5877 50  0000 C CNN
F 2 "" H 6650 6050 50  0000 C CNN
F 3 "" H 6650 6050 50  0000 C CNN
	1    6650 6050
	1    0    0    -1  
$EndComp
$Comp
L C C39
U 1 1 58BCBAAB
P 8050 4650
F 0 "C39" H 8165 4696 50  0000 L CNN
F 1 "100n 6.5V" H 8165 4605 50  0000 L CNN
F 2 "agg:0603" H 8088 4500 50  0001 C CNN
F 3 "" H 8050 4650 50  0000 C CNN
	1    8050 4650
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L3
U 1 1 58BCC1B1
P 4650 4300
F 0 "L3" V 4472 4300 50  0000 C CNN
F 1 "3u3" V 4563 4300 50  0000 C CNN
F 2 "footprints:ELLATP3R3NB" H 4650 4300 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2085547.pdf" H 4650 4300 50  0001 C CNN
F 4 "1865686" H 4650 4300 60  0001 C CNN "Farnell"
	1    4650 4300
	0    1    1    0   
$EndComp
NoConn ~ 7750 5400
NoConn ~ 7750 5600
$Comp
L GND #PWR66
U 1 1 58BCCF2C
P 7950 6100
F 0 "#PWR66" H 7950 5850 50  0001 C CNN
F 1 "GND" H 7955 5927 50  0000 C CNN
F 2 "" H 7950 6100 50  0000 C CNN
F 3 "" H 7950 6100 50  0000 C CNN
	1    7950 6100
	1    0    0    -1  
$EndComp
$Comp
L C C43
U 1 1 58BCCFE2
P 8250 5950
F 0 "C43" H 8365 5996 50  0000 L CNN
F 1 "2u2" H 8365 5905 50  0000 L CNN
F 2 "agg:0603" H 8288 5800 50  0001 C CNN
F 3 "" H 8250 5950 50  0000 C CNN
	1    8250 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR67
U 1 1 58BCD1A4
P 8250 6100
F 0 "#PWR67" H 8250 5850 50  0001 C CNN
F 1 "GND" H 8255 5927 50  0000 C CNN
F 2 "" H 8250 6100 50  0000 C CNN
F 3 "" H 8250 6100 50  0000 C CNN
	1    8250 6100
	1    0    0    -1  
$EndComp
$Comp
L C C41
U 1 1 58BCD9AB
P 8900 5200
F 0 "C41" H 9015 5246 50  0000 L CNN
F 1 "2u" H 9015 5155 50  0000 L CNN
F 2 "agg:1206" H 8938 5050 50  0001 C CNN
F 3 "" H 8900 5200 50  0000 C CNN
	1    8900 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR62
U 1 1 58BCDD4D
P 8900 5350
F 0 "#PWR62" H 8900 5100 50  0001 C CNN
F 1 "GND" H 8905 5177 50  0000 C CNN
F 2 "" H 8900 5350 50  0000 C CNN
F 3 "" H 8900 5350 50  0000 C CNN
	1    8900 5350
	1    0    0    -1  
$EndComp
$Comp
L R R27
U 1 1 58BCE20E
P 9350 5350
F 0 "R27" H 9420 5396 50  0000 L CNN
F 1 "2M" H 9420 5305 50  0000 L CNN
F 2 "agg:0603" V 9280 5350 50  0001 C CNN
F 3 "" H 9350 5350 50  0000 C CNN
F 4 "2059687" H 9350 5350 60  0001 C CNN "Farnell"
	1    9350 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR65
U 1 1 58BCE5C3
P 9350 6050
F 0 "#PWR65" H 9350 5800 50  0001 C CNN
F 1 "GND" H 9355 5877 50  0000 C CNN
F 2 "" H 9350 6050 50  0000 C CNN
F 3 "" H 9350 6050 50  0000 C CNN
	1    9350 6050
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR59
U 1 1 58BCF882
P 9800 5000
F 0 "#PWR59" H 9800 4850 50  0001 C CNN
F 1 "+12V" V 9815 5128 50  0000 L CNN
F 2 "" H 9800 5000 50  0000 C CNN
F 3 "" H 9800 5000 50  0000 C CNN
	1    9800 5000
	0    1    1    0   
$EndComp
$Comp
L R R28
U 1 1 58BCE2DE
P 9350 5900
F 0 "R28" H 9420 5946 50  0000 L CNN
F 1 "160k" H 9420 5855 50  0000 L CNN
F 2 "agg:0603" V 9280 5900 50  0001 C CNN
F 3 "" H 9350 5900 50  0000 C CNN
F 4 "2670652" H 9350 5900 60  0001 C CNN "Farnell"
	1    9350 5900
	1    0    0    -1  
$EndComp
Text Label 5150 4300 0    60   ~ 0
+48V
Wire Wire Line
	1450 2850 1450 2650
Wire Wire Line
	1450 2650 1500 2650
Wire Wire Line
	1450 2100 1450 1950
Wire Wire Line
	1450 1950 1500 1950
Wire Wire Line
	2550 1900 2750 1900
Wire Wire Line
	2750 1900 2750 2850
Wire Wire Line
	2550 2250 3150 2250
Wire Wire Line
	3150 2250 3150 2850
Wire Wire Line
	2500 1850 2550 1850
Wire Wire Line
	2550 1850 2550 1950
Wire Wire Line
	2550 1950 2500 1950
Connection ~ 2550 1900
Wire Wire Line
	2500 2150 2550 2150
Wire Wire Line
	2550 2150 2550 2350
Wire Wire Line
	2550 2350 2500 2350
Connection ~ 2550 2250
Wire Wire Line
	2500 2050 4350 2050
Wire Wire Line
	2500 2450 3400 2450
Wire Wire Line
	3400 2450 3400 2250
Wire Wire Line
	3400 2250 4350 2250
Wire Wire Line
	2500 2550 3450 2550
Wire Wire Line
	3450 2550 3450 2450
Wire Wire Line
	3450 2450 4350 2450
Wire Wire Line
	4350 2650 2500 2650
Wire Wire Line
	4350 2550 3950 2550
Wire Wire Line
	3950 2550 3950 2850
Wire Wire Line
	4350 2150 3550 2150
Wire Wire Line
	3550 2150 3550 2850
Wire Wire Line
	2750 3450 2750 3550
Wire Wire Line
	2750 3550 3950 3550
Wire Wire Line
	3150 3550 3150 3450
Wire Wire Line
	3550 3550 3550 3450
Connection ~ 3150 3550
Wire Wire Line
	3950 3550 3950 3450
Connection ~ 3550 3550
Wire Wire Line
	4950 2550 5250 2550
Wire Wire Line
	5250 2550 5250 2850
Wire Wire Line
	4950 2150 5650 2150
Wire Wire Line
	5650 2150 5650 2850
Wire Wire Line
	4950 2650 7450 2650
Wire Wire Line
	4950 2450 5850 2450
Wire Wire Line
	5850 2450 5850 2550
Wire Wire Line
	5850 2550 7450 2550
Wire Wire Line
	4950 2250 5950 2250
Wire Wire Line
	5950 2250 5950 2450
Wire Wire Line
	5950 2450 7450 2450
Wire Wire Line
	4950 2050 6050 2050
Wire Wire Line
	6050 2050 6050 2350
Wire Wire Line
	6050 2350 7450 2350
Wire Wire Line
	7350 2050 7350 2150
Wire Wire Line
	7350 2050 7450 2050
Wire Wire Line
	7350 2150 7450 2150
Wire Wire Line
	7450 3050 7450 2950
Wire Wire Line
	6600 3050 7450 3050
Wire Wire Line
	6900 3050 6900 3200
Connection ~ 6900 3050
Wire Wire Line
	6600 2750 7450 2750
Wire Wire Line
	7450 2750 7450 2850
Wire Wire Line
	7300 3200 7300 2750
Connection ~ 7300 2750
Connection ~ 7350 2150
Wire Wire Line
	6500 1850 7450 1850
Connection ~ 6950 1850
Wire Wire Line
	6050 750  6050 1400
Wire Wire Line
	6050 850  6150 850 
Wire Wire Line
	6050 1400 7200 1400
Connection ~ 6050 850 
Connection ~ 6450 1400
Wire Wire Line
	7200 1400 7200 1650
Wire Wire Line
	7200 1650 7450 1650
Connection ~ 6850 1400
Wire Wire Line
	6350 850  7300 850 
Connection ~ 6450 850 
Wire Wire Line
	7300 850  7300 1550
Wire Wire Line
	7300 1550 7450 1550
Connection ~ 6850 850 
Wire Wire Line
	8650 1850 8700 1850
Wire Wire Line
	8700 1750 8650 1750
Wire Wire Line
	8650 1650 8700 1650
Wire Wire Line
	8700 1550 8650 1550
Wire Wire Line
	8900 1550 9100 1550
Wire Wire Line
	9100 1650 8900 1650
Wire Wire Line
	8900 1750 9100 1750
Wire Wire Line
	9100 1850 8900 1850
Wire Wire Line
	8650 2550 9100 2550
Wire Wire Line
	8650 2250 9100 2250
Wire Wire Line
	9100 2150 8650 2150
Wire Wire Line
	8650 2050 9100 2050
Wire Wire Line
	8650 2450 9100 2450
Wire Wire Line
	9000 2400 9550 2400
Connection ~ 9000 2450
Wire Wire Line
	9000 2400 9000 2450
Wire Wire Line
	9550 2400 9550 2350
Wire Wire Line
	8650 2750 9400 2750
Wire Wire Line
	9700 2750 9700 2800
Connection ~ 10200 3050
Connection ~ 9950 3050
Wire Wire Line
	8650 3050 10450 3050
Wire Wire Line
	9950 2750 9950 2650
Wire Wire Line
	9950 2650 10450 2650
Wire Wire Line
	10450 2650 10450 2750
Wire Wire Line
	10200 2600 10200 2650
Connection ~ 10200 2650
Wire Wire Line
	1450 1800 1450 1850
Wire Wire Line
	1450 1850 1500 1850
Wire Wire Line
	1350 2100 1450 2100
Wire Wire Line
	1050 2100 850  2100
Wire Wire Line
	1450 2500 1500 2500
Wire Wire Line
	1500 2500 1500 2550
Wire Wire Line
	850  2850 1050 2850
Wire Wire Line
	1350 2850 1450 2850
Wire Wire Line
	1150 5050 1200 5050
Wire Wire Line
	1200 5000 1200 5100
Connection ~ 1200 5050
Wire Wire Line
	1450 5050 1500 5050
Wire Wire Line
	1500 5000 1500 5100
Connection ~ 1500 5050
Wire Wire Line
	2050 5050 2100 5050
Wire Wire Line
	2100 5000 2100 5100
Connection ~ 2100 5050
Wire Wire Line
	1750 5050 1800 5050
Wire Wire Line
	1800 5000 1800 5100
Connection ~ 1800 5050
Wire Wire Line
	1200 5400 3550 5400
Connection ~ 1500 5400
Connection ~ 1800 5400
Wire Wire Line
	1200 4700 3900 4700
Connection ~ 1500 4700
Connection ~ 1800 4700
Wire Wire Line
	2450 5400 2450 5200
Connection ~ 2100 5400
Connection ~ 2450 5400
Connection ~ 2100 4700
Wire Wire Line
	3300 4800 3900 4800
Wire Wire Line
	3650 5100 3550 5100
Wire Wire Line
	3850 5100 3900 5100
Wire Wire Line
	3850 5200 3900 5200
Wire Wire Line
	3550 5100 3550 4700
Connection ~ 3550 4700
Wire Wire Line
	3300 4800 3300 5400
Connection ~ 3300 5400
Wire Wire Line
	3650 5200 3550 5200
Wire Wire Line
	3550 5200 3550 5400
Wire Wire Line
	3900 4900 3800 4900
Wire Wire Line
	3800 4900 3800 4800
Connection ~ 3800 4800
Wire Wire Line
	3800 4700 3800 4300
Wire Wire Line
	3800 4300 4350 4300
Connection ~ 3800 4700
Wire Wire Line
	4700 5100 4800 5100
Wire Wire Line
	4800 5100 4800 5300
Wire Wire Line
	4700 5000 6750 5000
Wire Wire Line
	6700 4300 6700 4800
Wire Wire Line
	6700 4700 6750 4700
Connection ~ 6700 4600
Wire Wire Line
	6700 4800 6750 4800
Connection ~ 6700 4700
Wire Wire Line
	6750 4600 6700 4600
Wire Wire Line
	6700 5200 6750 5200
Wire Wire Line
	6750 5400 6200 5400
Wire Wire Line
	6750 5700 6650 5700
Wire Wire Line
	6650 5700 6650 6050
Wire Wire Line
	6650 5800 6750 5800
Wire Wire Line
	6650 5900 6750 5900
Connection ~ 6650 5800
Connection ~ 6650 5900
Wire Wire Line
	7750 4800 8050 4800
Wire Wire Line
	8050 4500 7850 4500
Wire Wire Line
	7850 4500 7850 4600
Wire Wire Line
	7850 4600 7750 4600
Wire Wire Line
	7850 4800 7850 5000
Wire Wire Line
	7850 4900 7750 4900
Connection ~ 7850 4800
Wire Wire Line
	7750 5000 8200 5000
Connection ~ 7850 4900
Connection ~ 7850 5000
Wire Wire Line
	7750 5900 7850 5900
Wire Wire Line
	7850 5900 7850 6000
Wire Wire Line
	7750 6000 7950 6000
Wire Wire Line
	7950 6000 7950 6100
Connection ~ 7850 6000
Wire Wire Line
	7750 5800 8250 5800
Wire Wire Line
	8900 5000 8900 5050
Connection ~ 8900 5000
Wire Wire Line
	9350 5000 9350 5200
Connection ~ 9350 5000
Wire Wire Line
	8600 5650 8600 5200
Wire Wire Line
	8600 5200 7750 5200
Wire Wire Line
	9350 5500 9350 5750
Connection ~ 9350 5650
Connection ~ 6400 4300
Wire Wire Line
	4950 4300 6700 4300
Text Label 5300 5000 0    60   ~ 0
POE_GOOD
$Comp
L C C40
U 1 1 58BBBA7E
P 2750 5100
F 0 "C40" H 2865 5146 50  0000 L CNN
F 1 "100n 60V" H 2865 5055 50  0000 L CNN
F 2 "agg:0805" H 2788 4950 50  0001 C CNN
F 3 "" H 2750 5100 50  0000 C CNN
	1    2750 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5400 2750 5250
Connection ~ 2750 5400
Wire Wire Line
	2750 4950 2750 4700
Connection ~ 2750 4700
Wire Wire Line
	2450 5000 2450 4700
Connection ~ 2450 4700
Wire Wire Line
	5900 4650 5900 4300
Connection ~ 5900 4300
Wire Wire Line
	5900 4850 5900 5000
Connection ~ 5900 5000
Wire Wire Line
	8800 5000 9800 5000
Wire Wire Line
	9350 5650 8600 5650
$Comp
L +12V #PWR58
U 1 1 58BC71BD
P 4900 4700
F 0 "#PWR58" H 4900 4550 50  0001 C CNN
F 1 "+12V" H 4915 4873 50  0000 C CNN
F 2 "" H 4900 4700 50  0000 C CNN
F 3 "" H 4900 4700 50  0000 C CNN
	1    4900 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4700 4900 4800
Wire Wire Line
	4900 4800 4700 4800
Text Label 3550 2150 2    60   ~ 0
VA1
Text Label 3950 2550 2    60   ~ 0
VA2
$Comp
L TEST-RESCUE-bigtime TP3
U 1 1 58D5FB4B
P 5650 4200
AR Path="/58D5FB4B" Ref="TP3"  Part="1" 
AR Path="/58B736A9/58D5FB4B" Ref="TP3"  Part="1" 
F 0 "TP3" H 5728 4340 50  0000 L CNN
F 1 "+48V" H 5728 4249 50  0000 L CNN
F 2 "agg:SIL-254P-01" H 5650 4200 50  0001 C CNN
F 3 "" H 5650 4200 50  0001 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4200 5650 4300
Connection ~ 5650 4300
$Comp
L TEST-RESCUE-bigtime TP4
U 1 1 58D6337D
P 9600 4850
AR Path="/58D6337D" Ref="TP4"  Part="1" 
AR Path="/58B736A9/58D6337D" Ref="TP4"  Part="1" 
F 0 "TP4" H 9678 4990 50  0000 L CNN
F 1 "+12V" H 9678 4899 50  0000 L CNN
F 2 "agg:SIL-254P-01" H 9600 4850 50  0001 C CNN
F 3 "" H 9600 4850 50  0001 C CNN
	1    9600 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 4850 9600 5000
Connection ~ 9600 5000
$Comp
L TEST-RESCUE-bigtime TP5
U 1 1 58D6A1A7
P 5200 5100
AR Path="/58D6A1A7" Ref="TP5"  Part="1" 
AR Path="/58B736A9/58D6A1A7" Ref="TP5"  Part="1" 
F 0 "TP5" H 5122 5147 50  0000 R CNN
F 1 "POE_GOOD" H 5122 5238 50  0000 R CNN
F 2 "agg:SIL-254P-01" H 5200 5100 50  0001 C CNN
F 3 "" H 5200 5100 50  0001 C CNN
	1    5200 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 5100 5200 5000
Connection ~ 5200 5000
$EndSCHEMATC
