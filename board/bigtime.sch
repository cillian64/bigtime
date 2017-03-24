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
P 8500 5850
F 0 "IC1" H 8500 6575 50  0000 C CNN
F 1 "NPIC6C596A" H 8500 6484 50  0000 C CNN
F 2 "agg:TSSOP-16" H 2300 200 50  0001 L CNN
F 3 "http://assets.nexperia.com/documents/data-sheet/NPIC6C596A.pdf" H 2300 100 50  0001 L CNN
F 4 "2445196" H 2300 0   50  0001 L CNN "Farnell"
	1    8500 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 58AB653E
P 8950 3500
F 0 "#PWR01" H 5750 2050 50  0001 C CNN
F 1 "GND" H 8955 3327 50  0000 C CNN
F 2 "" H 5750 2300 50  0000 C CNN
F 3 "" H 5750 2300 50  0000 C CNN
	1    8950 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58AB65DB
P 9850 3500
F 0 "#PWR02" H 5900 1600 50  0001 C CNN
F 1 "GND" H 9855 3327 50  0000 C CNN
F 2 "" H 5900 1850 50  0000 C CNN
F 3 "" H 5900 1850 50  0000 C CNN
	1    9850 3500
	1    0    0    -1  
$EndComp
Text Label 8950 3200 0    60   ~ 0
DS_IN
Text Label 9850 3200 2    60   ~ 0
DS_OUT
Text Label 8100 5950 2    60   ~ 0
DS_IN
Text Label 9000 6350 0    60   ~ 0
DS_OUT
Text Label 9250 3300 0    60   ~ 0
SHCP
Text Label 9250 3400 0    60   ~ 0
STCP
Text Label 8100 6050 2    60   ~ 0
SHCP
Text Label 8100 6150 2    60   ~ 0
STCP
Text Label 4250 4650 0    60   ~ 0
DS_IN
Text Label 4250 4750 0    60   ~ 0
SHCP
Text Label 4250 4850 0    60   ~ 0
STCP
$Comp
L +3V3 #PWR03
U 1 1 58AB6B00
P 9500 2950
F 0 "#PWR03" H 5850 1800 50  0001 C CNN
F 1 "+3V3" H 9515 3123 50  0000 C CNN
F 2 "" H 5850 1950 50  0000 C CNN
F 3 "" H 5850 1950 50  0000 C CNN
	1    9500 2950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P1
U 1 1 58AB6B62
P 8750 3250
F 0 "P1" H 8669 2775 50  0000 C CNN
F 1 "CONN_IN" H 8669 2866 50  0000 C CNN
F 2 "Connect:IDC_Header_Straight_6pins" H 5650 2050 50  0001 C CNN
F 3 "" H 5650 2050 50  0000 C CNN
	1    8750 3250
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X06 P2
U 1 1 58AB6BAF
P 10050 3250
F 0 "P2" H 9968 2775 50  0000 C CNN
F 1 "CONN_OUT" H 9968 2866 50  0000 C CNN
F 2 "Connect:IDC_Header_Straight_6pins" H 6950 2050 50  0001 C CNN
F 3 "" H 6950 2050 50  0000 C CNN
	1    10050 3250
	1    0    0    1   
$EndComp
$Comp
L TPS62152-RESCUE-bigtime IC2
U 1 1 58AB6DDC
P 9100 1600
F 0 "IC2" H 9100 2425 50  0000 C CNN
F 1 "TPS62152" H 9100 2334 50  0000 C CNN
F 2 "agg:QFN-16-EP-TI" H 1950 -250 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62152.pdf" H 1950 -350 50  0001 L CNN
F 4 "2382918" H 1950 -450 50  0001 L CNN "Farnell"
	1    9100 1600
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR04
U 1 1 58AB6FA8
P 8100 900
F 0 "#PWR04" H 1500 -500 50  0001 C CNN
F 1 "+12V" H 8115 1073 50  0000 C CNN
F 2 "" H 1500 -350 50  0000 C CNN
F 3 "" H 1500 -350 50  0000 C CNN
	1    8100 900 
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 58AB7017
P 8100 1150
F 0 "C2" H 8215 1196 50  0000 L CNN
F 1 "10u" H 8215 1105 50  0000 L CNN
F 2 "agg:0603" H 2288 -200 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1955679.pdf" H 2250 -50 50  0001 C CNN
F 4 "2494230" H 8100 1150 60  0001 C CNN "Farnell"
	1    8100 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 58AB7079
P 8100 1550
F 0 "#PWR05" H 1900 -50 50  0001 C CNN
F 1 "GND" H 8105 1377 50  0000 C CNN
F 2 "" H 1900 200 50  0000 C CNN
F 3 "" H 1900 200 50  0000 C CNN
	1    8100 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58AB711C
P 8600 2300
F 0 "#PWR06" H 2250 -350 50  0001 C CNN
F 1 "GND" H 8605 2127 50  0000 C CNN
F 2 "" H 2250 -100 50  0000 C CNN
F 3 "" H 2250 -100 50  0000 C CNN
	1    8600 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 58AB72DE
P 9600 1800
F 0 "#PWR07" H 2100 -200 50  0001 C CNN
F 1 "GND" H 9605 1627 50  0000 C CNN
F 2 "" H 2100 50  50  0000 C CNN
F 3 "" H 2100 50  50  0000 C CNN
	1    9600 1800
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR_SMALL L1
U 1 1 58AB73EF
P 9900 1000
F 0 "L1" H 9900 1215 50  0000 C CNN
F 1 "2u2" H 9900 1124 50  0000 C CNN
F 2 "footprints:L2520" H 1800 -50 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/74479887222C.pdf" H 1800 -50 50  0001 C CNN
F 4 "2543271" H 9900 1000 60  0001 C CNN "Farnell"
	1    9900 1000
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58AB75BC
P 10450 1150
F 0 "C4" H 10565 1196 50  0000 L CNN
F 1 "22u" H 10565 1105 50  0000 L CNN
F 2 "agg:0805" H 1988 -200 50  0001 C CNN
F 3 "" H 1950 -50 50  0000 C CNN
	1    10450 1150
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR08
U 1 1 58AB765A
P 10950 950
F 0 "#PWR08" H 11000 1000 50  0001 C CNN
F 1 "+3V3" H 10965 1123 50  0000 C CNN
F 2 "" H 2150 -150 50  0000 C CNN
F 3 "" H 2150 -150 50  0000 C CNN
	1    10950 950 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 58AB76DE
P 10450 1300
F 0 "#PWR09" H 2350 -500 50  0001 C CNN
F 1 "GND" H 10455 1127 50  0000 C CNN
F 2 "" H 2350 -250 50  0000 C CNN
F 3 "" H 2350 -250 50  0000 C CNN
	1    10450 1300
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 58AB7880
P 8500 1500
F 0 "C3" V 8248 1500 50  0000 C CNN
F 1 "3.3n" V 8339 1500 50  0000 C CNN
F 2 "agg:0603" H 2388 50  50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1958513.pdf" H 2350 200 50  0001 C CNN
F 4 "2496853" H 8500 1500 60  0001 C CNN "Farnell"
	1    8500 1500
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 58AB8171
P 7650 5300
F 0 "C1" H 7765 5346 50  0000 L CNN
F 1 "100n" H 7765 5255 50  0000 L CNN
F 2 "agg:0603" H 3188 -50 50  0001 C CNN
F 3 "" H 3150 100 50  0000 C CNN
	1    7650 5300
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR010
U 1 1 58AB81EC
P 7650 5450
F 0 "#PWR010" H 3250 150 50  0001 C CNN
F 1 "GND" H 7655 5277 50  0000 C CNN
F 2 "" H 3250 400 50  0000 C CNN
F 3 "" H 3250 400 50  0000 C CNN
	1    7650 5450
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR011
U 1 1 58AB83D7
P 7650 5150
F 0 "#PWR011" H 3200 350 50  0001 C CNN
F 1 "+3V3" H 7665 5323 50  0000 C CNN
F 2 "" H 3200 500 50  0000 C CNN
F 3 "" H 3200 500 50  0000 C CNN
	1    7650 5150
	1    0    0    -1  
$EndComp
$Comp
L SA40-19 U1
U 1 1 58AB8F4C
P 10650 5550
F 0 "U1" H 10550 6150 60  0000 L CNN
F 1 "SA40-19" H 10400 4950 60  0000 L CNN
F 2 "footprints:SA40-18" H 2900 400 60  0001 C CNN
F 3 "" H 2900 400 60  0001 C CNN
	1    10650 5550
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58AC6016
P 9100 5350
F 0 "R1" V 9050 5550 50  0000 C CNN
F 1 "750" V 9100 5350 50  0000 C CNN
F 2 "agg:0603" V 3130 1550 50  0001 C CNN
F 3 "" H 3200 1550 50  0001 C CNN
	1    9100 5350
	0    1    1    0   
$EndComp
$Comp
L PART X1
U 1 1 58AC7EDC
P 550 7100
F 0 "X1" H 1078 7196 50  0000 L CNN
F 1 "M3_HOLE" H 1078 7105 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -2450 -150 50  0001 C CNN
F 3 "" H -2450 -150 50  0001 C CNN
	1    550  7100
	1    0    0    -1  
$EndComp
$Comp
L PART X2
U 1 1 58AC8280
P 550 7300
F 0 "X2" H 1078 7396 50  0000 L CNN
F 1 "M3_HOLE" H 1078 7305 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -2450 50  50  0001 C CNN
F 3 "" H -2450 50  50  0001 C CNN
	1    550  7300
	1    0    0    -1  
$EndComp
$Comp
L PART X3
U 1 1 58AC82C0
P 550 7500
F 0 "X3" H 1078 7596 50  0000 L CNN
F 1 "M3_HOLE" H 1078 7505 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -2450 250 50  0001 C CNN
F 3 "" H -2450 250 50  0001 C CNN
	1    550  7500
	1    0    0    -1  
$EndComp
$Comp
L PART X4
U 1 1 58AC82FE
P 550 7700
F 0 "X4" H 1078 7796 50  0000 L CNN
F 1 "M3_HOLE" H 1078 7705 50  0000 L CNN
F 2 "agg:M3_MOUNT" H -2450 450 50  0001 C CNN
F 3 "" H -2450 450 50  0001 C CNN
	1    550  7700
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 58B70876
P 9450 5450
F 0 "R4" V 9400 5650 50  0000 C CNN
F 1 "750" V 9450 5450 50  0000 C CNN
F 2 "agg:0603" V 3480 1650 50  0001 C CNN
F 3 "" H 3550 1650 50  0001 C CNN
	1    9450 5450
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 58B708B4
P 9100 5550
F 0 "R5" V 9050 5750 50  0000 C CNN
F 1 "750" V 9100 5550 50  0000 C CNN
F 2 "agg:0603" V 3130 1750 50  0001 C CNN
F 3 "" H 3200 1750 50  0001 C CNN
	1    9100 5550
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 58B708F8
P 9450 5650
F 0 "R6" V 9400 5850 50  0000 C CNN
F 1 "750" V 9450 5650 50  0000 C CNN
F 2 "agg:0603" V 3480 1850 50  0001 C CNN
F 3 "" H 3550 1850 50  0001 C CNN
	1    9450 5650
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 58B7093A
P 9100 5750
F 0 "R7" V 9050 5950 50  0000 C CNN
F 1 "750" V 9100 5750 50  0000 C CNN
F 2 "agg:0603" V 3130 1950 50  0001 C CNN
F 3 "" H 3200 1950 50  0001 C CNN
	1    9100 5750
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 58B7097E
P 9450 5850
F 0 "R8" V 9400 6050 50  0000 C CNN
F 1 "750" V 9450 5850 50  0000 C CNN
F 2 "agg:0603" V 3480 2050 50  0001 C CNN
F 3 "" H 3550 2050 50  0001 C CNN
	1    9450 5850
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 58B709C6
P 9100 5950
F 0 "R9" V 9050 6150 50  0000 C CNN
F 1 "750" V 9100 5950 50  0000 C CNN
F 2 "agg:0603" V 3130 2150 50  0001 C CNN
F 3 "" H 3200 2150 50  0001 C CNN
	1    9100 5950
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 58B70A14
P 9350 6050
F 0 "R10" V 9300 6250 50  0000 C CNN
F 1 "750" V 9350 6050 50  0000 C CNN
F 2 "agg:0603" V 3380 2250 50  0001 C CNN
F 3 "" H 3450 2250 50  0001 C CNN
	1    9350 6050
	0    1    1    0   
$EndComp
$Comp
L D_Zener_Small D1
U 1 1 58B70BEE
P 9800 6050
F 0 "D1" H 9900 6150 50  0000 C CNN
F 1 "3.9V" H 9700 6150 50  0000 C CNN
F 2 "" V 950 100 50  0001 C CNN
F 3 "" V 950 100 50  0001 C CNN
	1    9800 6050
	-1   0    0    1   
$EndComp
$Comp
L LM317_SOT223 U2
U 1 1 58B71899
P 8800 4200
F 0 "U2" H 8800 4615 50  0000 C CNN
F 1 "LM317_SOT223" H 8800 4524 50  0000 C CNN
F 2 "" H 800 200 50  0001 C CNN
F 3 "" H 800 200 50  0001 C CNN
	1    8800 4200
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR012
U 1 1 58B71B7B
P 8350 4000
F 0 "#PWR012" H 8400 4050 50  0001 C CNN
F 1 "+12V" H 8365 4173 50  0000 C CNN
F 2 "" H 250 100 50  0001 C CNN
F 3 "" H 250 100 50  0001 C CNN
	1    8350 4000
	1    0    0    -1  
$EndComp
$Comp
L C C22
U 1 1 58B7225C
P 8350 4250
F 0 "C22" H 8235 4204 50  0000 R CNN
F 1 "C" H 8235 4295 50  0000 R CNN
F 2 "agg:0603" H 1388 350 50  0001 C CNN
F 3 "" H 1350 500 50  0001 C CNN
	1    8350 4250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR013
U 1 1 58B72373
P 8350 4400
F 0 "#PWR013" H 8400 4450 50  0001 C CNN
F 1 "GND" H 8355 4227 50  0000 C CNN
F 2 "" H 800 250 50  0001 C CNN
F 3 "" H 800 250 50  0001 C CNN
	1    8350 4400
	1    0    0    -1  
$EndComp
$Comp
L C C21
U 1 1 58B723D5
P 9250 4200
F 0 "C21" H 9365 4246 50  0000 L CNN
F 1 "C" H 9365 4155 50  0000 L CNN
F 2 "agg:0603" H 1738 -150 50  0001 C CNN
F 3 "" H 1700 0   50  0001 C CNN
	1    9250 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 58B72502
P 9250 4350
F 0 "#PWR014" H 9300 4400 50  0001 C CNN
F 1 "GND" H 9255 4177 50  0001 C CNN
F 2 "" H 800 350 50  0001 C CNN
F 3 "" H 800 350 50  0001 C CNN
	1    9250 4350
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 58B72566
P 9550 4200
F 0 "R2" H 9620 4246 50  0000 L CNN
F 1 "380k" H 9620 4155 50  0000 L CNN
F 2 "agg:0603" V 780 150 50  0001 C CNN
F 3 "" H 850 150 50  0001 C CNN
	1    9550 4200
	1    0    0    -1  
$EndComp
$Comp
L POT-RESCUE-bigtime RV1
U 1 1 58B7266E
P 9550 4500
F 0 "RV1" H 9480 4454 50  0000 R CNN
F 1 "100k" H 9480 4545 50  0000 R CNN
F 2 "" H 850 800 50  0001 C CNN
F 3 "" H 850 800 50  0001 C CNN
	1    9550 4500
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 58B727F2
P 9550 4800
F 0 "R3" H 9620 4846 50  0000 L CNN
F 1 "0" H 9620 4755 50  0000 L CNN
F 2 "agg:0603" V 880 250 50  0001 C CNN
F 3 "" H 950 250 50  0001 C CNN
	1    9550 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 58B7299B
P 9550 4950
F 0 "#PWR015" H 9600 5000 50  0001 C CNN
F 1 "GND" H 9555 4777 50  0000 C CNN
F 2 "" H 450 1100 50  0001 C CNN
F 3 "" H 450 1100 50  0001 C CNN
	1    9550 4950
	1    0    0    -1  
$EndComp
Text Label 9900 4050 0    60   ~ 0
V_LED_BUS
Text Label 9200 2700 0    60   ~ 0
V_LED_BUS
Text Notes 8850 4550 0    60   ~ 0
1.25V
Text Notes 9750 3950 0    60   ~ 0
160mA nominal
$Sheet
S 5900 4850 800  1200
U 58B736A9
F0 "ethernet" 60
F1 "ethernet.sch" 60
F2 "RXD1" O L 5900 4900 60 
F3 "RXD0" O L 5900 5000 60 
F4 "CRS_DV" O L 5900 5100 60 
F5 "REF_CLK" O L 5900 5200 60 
F6 "TXEN" I L 5900 5400 60 
F7 "TXD1" I L 5900 5500 60 
F8 "TXD0" I L 5900 5600 60 
F9 "MDIO" B L 5900 5900 60 
F10 "MDC" I L 5900 6000 60 
F11 "TRAFFIC_LED" I L 5900 5700 60 
$EndSheet
$Comp
L CONN_01X02 P3
U 1 1 58BC54A8
P 7900 3000
F 0 "P3" H 7819 2725 50  0000 C CNN
F 1 "+12V" H 7819 2816 50  0000 C CNN
F 2 "Connect:BARREL_JACK" H 7900 3000 50  0001 C CNN
F 3 "" H 7900 3000 50  0000 C CNN
	1    7900 3000
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR016
U 1 1 58BC5CDB
P 8100 3050
F 0 "#PWR016" H 8100 2800 50  0001 C CNN
F 1 "GND" V 8050 2850 50  0000 C CNN
F 2 "" H 8100 3050 50  0000 C CNN
F 3 "" H 8100 3050 50  0000 C CNN
	1    8100 3050
	0    -1   -1   0   
$EndComp
$Comp
L +12V #PWR017
U 1 1 58BC5F20
P 8100 2950
F 0 "#PWR017" H 8100 2800 50  0001 C CNN
F 1 "+12V" V 8050 3150 50  0000 C CNN
F 2 "" H 8100 2950 50  0000 C CNN
F 3 "" H 8100 2950 50  0000 C CNN
	1    8100 2950
	0    1    1    0   
$EndComp
$Comp
L STM32F4xxVxTx IC4
U 1 1 58BC81E7
P 3150 4550
F 0 "IC4" H 3150 7775 50  0000 C CNN
F 1 "STM32F407VET6" H 3150 7684 50  0000 C CNN
F 2 "agg:LQFP-100" H 2700 1350 50  0001 L CNN
F 3 "http://www.st.com/resource/en/datasheet/stm32f407ve.pdf" H 2700 1250 50  0001 L CNN
F 4 "2064367" H 2700 1150 50  0001 L CNN "Farnell"
	1    3150 4550
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 58BDB203
P 1400 900
F 0 "C5" H 1450 1000 50  0000 L CNN
F 1 "100n" H 1450 800 50  0000 L CNN
F 2 "agg:0603" H 1438 750 50  0001 C CNN
F 3 "" H 1400 900 50  0000 C CNN
	1    1400 900 
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 58BDB52E
P 1750 900
F 0 "C6" H 1800 1000 50  0000 L CNN
F 1 "1u" H 1800 800 50  0000 L CNN
F 2 "agg:0603" H 1788 750 50  0001 C CNN
F 3 "" H 1750 900 50  0000 C CNN
	1    1750 900 
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 58BDB7EB
P 2450 900
F 0 "C8" H 2500 1000 50  0000 L CNN
F 1 "4u7" H 2500 800 50  0000 L CNN
F 2 "agg:0603" H 2488 750 50  0001 C CNN
F 3 "" H 2450 900 50  0000 C CNN
	1    2450 900 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR018
U 1 1 58BDC70F
P 1200 750
F 0 "#PWR018" H 1200 600 50  0001 C CNN
F 1 "+3V3" H 1215 923 50  0000 C CNN
F 2 "" H 1200 750 50  0000 C CNN
F 3 "" H 1200 750 50  0000 C CNN
	1    1200 750 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 58BDC8A3
P 1200 1050
F 0 "#PWR019" H 1200 800 50  0001 C CNN
F 1 "GND" H 1205 877 50  0000 C CNN
F 2 "" H 1200 1050 50  0000 C CNN
F 3 "" H 1200 1050 50  0000 C CNN
	1    1200 1050
	1    0    0    -1  
$EndComp
Text Notes 1300 1150 0    60   ~ 0
VBAT
$Comp
L C C7
U 1 1 58BDCB30
P 2100 900
F 0 "C7" H 2150 1000 50  0000 L CNN
F 1 "100n" H 2150 800 50  0000 L CNN
F 2 "agg:0603" H 2138 750 50  0001 C CNN
F 3 "" H 2100 900 50  0000 C CNN
	1    2100 900 
	1    0    0    -1  
$EndComp
Text Notes 2000 1150 0    60   ~ 0
VDDA
Text Notes 1650 1150 0    60   ~ 0
VDDA
Text Notes 2350 1150 0    60   ~ 0
VDD
$Comp
L C C9
U 1 1 58BDDA45
P 2800 900
F 0 "C9" H 2850 1000 50  0000 L CNN
F 1 "100n" H 2850 800 50  0000 L CNN
F 2 "agg:0603" H 2838 750 50  0001 C CNN
F 3 "" H 2800 900 50  0000 C CNN
	1    2800 900 
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 58BDDC6A
P 3100 900
F 0 "C10" H 3150 1000 50  0000 L CNN
F 1 "100n" H 3150 800 50  0000 L CNN
F 2 "agg:0603" H 3138 750 50  0001 C CNN
F 3 "" H 3100 900 50  0000 C CNN
	1    3100 900 
	1    0    0    -1  
$EndComp
$Comp
L C C11
U 1 1 58BDDD29
P 3400 900
F 0 "C11" H 3450 1000 50  0000 L CNN
F 1 "100n" H 3450 800 50  0000 L CNN
F 2 "agg:0603" H 3438 750 50  0001 C CNN
F 3 "" H 3400 900 50  0000 C CNN
	1    3400 900 
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 58BDDDE9
P 3700 900
F 0 "C12" H 3750 1000 50  0000 L CNN
F 1 "100n" H 3750 800 50  0000 L CNN
F 2 "agg:0603" H 3738 750 50  0001 C CNN
F 3 "" H 3700 900 50  0000 C CNN
	1    3700 900 
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 58BDDEAC
P 4000 900
F 0 "C13" H 4050 1000 50  0000 L CNN
F 1 "100n" H 4050 800 50  0000 L CNN
F 2 "agg:0603" H 4038 750 50  0001 C CNN
F 3 "" H 4000 900 50  0000 C CNN
	1    4000 900 
	1    0    0    -1  
$EndComp
$Comp
L C C14
U 1 1 58BDDF72
P 4300 900
F 0 "C14" H 4350 1000 50  0000 L CNN
F 1 "100n" H 4350 800 50  0000 L CNN
F 2 "agg:0603" H 4338 750 50  0001 C CNN
F 3 "" H 4300 900 50  0000 C CNN
	1    4300 900 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR020
U 1 1 58BDED17
P 2450 1450
F 0 "#PWR020" H 2450 1300 50  0001 C CNN
F 1 "+3V3" H 2465 1623 50  0000 C CNN
F 2 "" H 2450 1450 50  0000 C CNN
F 3 "" H 2450 1450 50  0000 C CNN
	1    2450 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 3300 9850 3300
Wire Wire Line
	9850 3400 8950 3400
Wire Wire Line
	9500 2950 9500 3100
Wire Wire Line
	8950 3100 9850 3100
Connection ~ 9500 3100
Wire Wire Line
	9200 2700 9200 3000
Wire Wire Line
	8950 3000 9850 3000
Connection ~ 9200 3000
Wire Wire Line
	8100 900  8100 1000
Wire Wire Line
	8100 1000 8700 1000
Wire Wire Line
	8600 1000 8600 1300
Wire Wire Line
	8600 1100 8700 1100
Connection ~ 8600 1000
Wire Wire Line
	8600 1200 8700 1200
Connection ~ 8600 1100
Connection ~ 8100 1000
Wire Wire Line
	8600 1300 8700 1300
Connection ~ 8600 1200
Wire Wire Line
	8600 2200 8700 2200
Wire Wire Line
	8600 1700 8600 2300
Wire Wire Line
	8700 2100 8600 2100
Connection ~ 8600 2200
Wire Wire Line
	8700 2000 8600 2000
Connection ~ 8600 2100
Wire Wire Line
	8700 1900 8600 1900
Connection ~ 8600 2000
Wire Wire Line
	8700 1800 8600 1800
Connection ~ 8600 1900
Wire Wire Line
	8700 1700 8600 1700
Connection ~ 8600 1800
Wire Wire Line
	9500 1400 9600 1400
Wire Wire Line
	9600 1400 9600 1800
Wire Wire Line
	9600 1200 9500 1200
Wire Wire Line
	9600 1000 9600 1200
Wire Wire Line
	9500 1000 9650 1000
Connection ~ 9600 1000
Wire Wire Line
	9500 1100 9600 1100
Connection ~ 9600 1100
Wire Wire Line
	10150 1000 10950 1000
Wire Wire Line
	10250 1000 10250 1500
Wire Wire Line
	10250 1500 9500 1500
Connection ~ 10250 1000
Wire Wire Line
	10950 1000 10950 950 
Connection ~ 10450 1000
Wire Wire Line
	8100 1300 8100 1550
Wire Wire Line
	8350 1500 8100 1500
Connection ~ 8100 1500
Wire Wire Line
	8650 1500 8700 1500
Wire Wire Line
	9500 1600 9600 1600
Connection ~ 9600 1600
Wire Wire Line
	7650 5450 8100 5450
Connection ~ 7650 5450
Wire Wire Line
	7650 5150 7900 5150
Wire Wire Line
	7900 5150 7900 5350
Wire Wire Line
	7900 5350 8100 5350
Connection ~ 7650 5150
Wire Wire Line
	8100 5750 7950 5750
Wire Wire Line
	7950 5750 7950 5450
Connection ~ 7950 5450
Wire Wire Line
	8100 5650 8050 5650
Wire Wire Line
	8050 5650 8050 5350
Connection ~ 8050 5350
Wire Wire Line
	8900 6250 8950 6250
Wire Wire Line
	8950 6250 8950 6350
Wire Wire Line
	8950 6350 9000 6350
Wire Wire Line
	8900 5350 8950 5350
Wire Wire Line
	9250 5350 9950 5350
Wire Wire Line
	8900 5450 9300 5450
Wire Wire Line
	9600 5450 9950 5450
Wire Wire Line
	8900 5550 8950 5550
Wire Wire Line
	9250 5550 9950 5550
Wire Wire Line
	8900 5650 9300 5650
Wire Wire Line
	9600 5650 9950 5650
Wire Wire Line
	8900 5750 8950 5750
Wire Wire Line
	9250 5750 9950 5750
Wire Wire Line
	8900 5850 9300 5850
Wire Wire Line
	9600 5850 9950 5850
Wire Wire Line
	8900 5950 8950 5950
Wire Wire Line
	9250 5950 9950 5950
Wire Wire Line
	8900 6050 9200 6050
Wire Wire Line
	9500 6050 9700 6050
Wire Wire Line
	9900 6050 9950 6050
Wire Wire Line
	8350 4000 8350 4100
Wire Wire Line
	8350 4050 8400 4050
Wire Wire Line
	9200 4050 9900 4050
Wire Wire Line
	9900 5050 9950 5050
Wire Wire Line
	9900 5150 9950 5150
Connection ~ 9900 5050
Connection ~ 8350 4050
Connection ~ 9250 4050
Connection ~ 9550 4050
Wire Wire Line
	1200 750  4300 750 
Wire Wire Line
	1200 1050 4300 1050
Connection ~ 1400 750 
Connection ~ 1400 1050
Connection ~ 1750 750 
Connection ~ 1750 1050
Connection ~ 2100 750 
Connection ~ 2100 1050
Connection ~ 2450 750 
Connection ~ 2450 1050
Connection ~ 2800 750 
Connection ~ 2800 1050
Connection ~ 3100 750 
Connection ~ 3100 1050
Connection ~ 3400 750 
Connection ~ 3400 1050
Connection ~ 3700 750 
Connection ~ 3700 1050
Connection ~ 4000 750 
Connection ~ 4000 1050
Wire Wire Line
	2450 1450 2450 2350
Wire Wire Line
	2450 1550 2550 1550
Wire Wire Line
	2450 1650 2550 1650
Connection ~ 2450 1550
Wire Wire Line
	2450 1750 2550 1750
Connection ~ 2450 1650
Wire Wire Line
	2450 1850 2550 1850
Connection ~ 2450 1750
Wire Wire Line
	2450 1950 2550 1950
Connection ~ 2450 1850
Wire Wire Line
	2450 2050 2550 2050
Connection ~ 2450 1950
Wire Wire Line
	2450 2150 2550 2150
Connection ~ 2450 2050
Wire Wire Line
	2450 2250 2550 2250
Connection ~ 2450 2150
Wire Wire Line
	2450 2350 2550 2350
Connection ~ 2450 2250
Wire Wire Line
	2450 3150 2550 3150
Wire Wire Line
	2450 2850 2450 3250
Wire Wire Line
	2350 3250 2550 3250
Wire Wire Line
	2500 3250 2500 3450
Wire Wire Line
	2500 3450 2550 3450
Connection ~ 2500 3250
Wire Wire Line
	2550 3050 2450 3050
Connection ~ 2450 3150
Wire Wire Line
	2550 2950 2450 2950
Connection ~ 2450 3050
Wire Wire Line
	2550 2850 2450 2850
Connection ~ 2450 2950
$Comp
L GND #PWR021
U 1 1 58BE0492
P 2350 3300
F 0 "#PWR021" H 2350 3050 50  0001 C CNN
F 1 "GND" H 2355 3127 50  0000 C CNN
F 2 "" H 2350 3300 50  0000 C CNN
F 3 "" H 2350 3300 50  0000 C CNN
	1    2350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3250 2350 3300
Connection ~ 2450 3250
$Comp
L C C15
U 1 1 58BE09DE
P 1750 2950
F 0 "C15" H 1800 3050 50  0000 L CNN
F 1 "2u2" H 1800 2850 50  0000 L CNN
F 2 "agg:0603" H 1788 2800 50  0001 C CNN
F 3 "" H 1750 2950 50  0000 C CNN
	1    1750 2950
	1    0    0    -1  
$EndComp
$Comp
L C C16
U 1 1 58BE0DFD
P 2000 2950
F 0 "C16" H 2050 3050 50  0000 L CNN
F 1 "2u2" H 2050 2850 50  0000 L CNN
F 2 "agg:0603" H 2038 2800 50  0001 C CNN
F 3 "" H 2000 2950 50  0000 C CNN
	1    2000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2800 2000 2650
Wire Wire Line
	2000 2650 2550 2650
Wire Wire Line
	1750 2800 1750 2550
Wire Wire Line
	1750 2550 2550 2550
$Comp
L GND #PWR022
U 1 1 58BE1218
P 1750 3100
F 0 "#PWR022" H 1750 2850 50  0001 C CNN
F 1 "GND" H 1755 2927 50  0000 C CNN
F 2 "" H 1750 3100 50  0000 C CNN
F 3 "" H 1750 3100 50  0000 C CNN
	1    1750 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 58BE1307
P 2000 3100
F 0 "#PWR023" H 2000 2850 50  0001 C CNN
F 1 "GND" H 2005 2927 50  0000 C CNN
F 2 "" H 2000 3100 50  0000 C CNN
F 3 "" H 2000 3100 50  0000 C CNN
	1    2000 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 58BE2016
P 900 3850
F 0 "#PWR024" H 900 3600 50  0001 C CNN
F 1 "GND" H 905 3677 50  0000 C CNN
F 2 "" H 900 3850 50  0000 C CNN
F 3 "" H 900 3850 50  0000 C CNN
	1    900  3850
	1    0    0    -1  
$EndComp
Text Label 800  3550 2    60   ~ 0
~RST
$Comp
L C C18
U 1 1 58BE2FDC
P 900 3700
F 0 "C18" H 950 3800 50  0000 L CNN
F 1 "100n" H 950 3600 50  0000 L CNN
F 2 "agg:0603" H 938 3550 50  0001 C CNN
F 3 "" H 900 3700 50  0000 C CNN
	1    900  3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  3550 2550 3550
Connection ~ 900  3550
$Comp
L SMD_XTAL Y1
U 1 1 58BE44B8
P 1500 3750
F 0 "Y1" V 1450 3750 50  0000 L CNN
F 1 "26M" V 1650 3700 50  0000 L CNN
F 2 "agg:XTAL-20x16" H 1550 3530 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1867890.pdf" H 1500 3750 50  0001 C CNN
F 4 "2455834" H 1500 3750 60  0001 C CNN "Farnell"
	1    1500 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 3750 2550 3750
Wire Wire Line
	1500 3850 2550 3850
$Comp
L C C19
U 1 1 58BE4BC3
P 1650 4100
F 0 "C19" H 1700 4200 50  0000 L CNN
F 1 "6p" H 1700 4000 50  0000 L CNN
F 2 "agg:0603" H 1688 3950 50  0001 C CNN
F 3 "" H 1650 4100 50  0000 C CNN
	1    1650 4100
	1    0    0    -1  
$EndComp
$Comp
L C C20
U 1 1 58BE5155
P 1900 4100
F 0 "C20" H 1950 4200 50  0000 L CNN
F 1 "6p" H 1950 4000 50  0000 L CNN
F 2 "agg:0603" H 1938 3950 50  0001 C CNN
F 3 "" H 1900 4100 50  0000 C CNN
	1    1900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3950 1650 3750
Connection ~ 1650 3750
Wire Wire Line
	1900 3950 1900 3850
Connection ~ 1900 3850
$Comp
L GND #PWR025
U 1 1 58BE546E
P 1650 4250
F 0 "#PWR025" H 1650 4000 50  0001 C CNN
F 1 "GND" H 1655 4077 50  0000 C CNN
F 2 "" H 1650 4250 50  0000 C CNN
F 3 "" H 1650 4250 50  0000 C CNN
	1    1650 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 58BE57D1
P 1900 4250
F 0 "#PWR026" H 1900 4000 50  0001 C CNN
F 1 "GND" H 1905 4077 50  0000 C CNN
F 2 "" H 1900 4250 50  0000 C CNN
F 3 "" H 1900 4250 50  0000 C CNN
	1    1900 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 58BE58CC
P 1350 3950
F 0 "#PWR027" H 1350 3700 50  0001 C CNN
F 1 "GND" H 1355 3777 50  0000 C CNN
F 2 "" H 1350 3950 50  0000 C CNN
F 3 "" H 1350 3950 50  0000 C CNN
	1    1350 3950
	1    0    0    -1  
$EndComp
Text Label 2550 5450 2    60   ~ 0
SWDIO
Text Label 2550 5550 2    60   ~ 0
SWDCLK
$Comp
L SWD P5
U 1 1 58BE8539
P 5900 7350
F 0 "P5" H 5900 7775 50  0000 C CNN
F 1 "SWD" H 5900 7684 50  0000 C CNN
F 2 "agg:FTSH-105-01-F-D-K" H 5500 6950 50  0001 L CNN
F 3 "" H 6250 7150 50  0001 C CNN
F 4 "FTSH-105-01-F-D-K" H 5500 6850 50  0001 L CNN "Toby"
	1    5900 7350
	1    0    0    -1  
$EndComp
$Comp
L SWD_TC P4
U 1 1 58BE8651
P 5900 6700
F 0 "P4" H 5900 7025 50  0000 C CNN
F 1 "SWD_TC" H 5900 6934 50  0000 C CNN
F 2 "agg:TC2030-NL" H 5600 6400 50  0001 L CNN
F 3 "" H 5500 6800 50  0001 C CNN
	1    5900 6700
	1    0    0    -1  
$EndComp
Text Label 6400 7150 0    60   ~ 0
SWDIO
Text Label 6400 7250 0    60   ~ 0
SWDCLK
Text Label 6300 6600 0    60   ~ 0
SWDIO
Text Label 6300 6700 0    60   ~ 0
SWDCLK
NoConn ~ 6300 6800
NoConn ~ 6400 7350
NoConn ~ 6400 7450
$Comp
L GND #PWR028
U 1 1 58BED3C9
P 5500 6800
F 0 "#PWR028" H 5500 6550 50  0001 C CNN
F 1 "GND" H 5505 6627 50  0000 C CNN
F 2 "" H 5500 6800 50  0000 C CNN
F 3 "" H 5500 6800 50  0000 C CNN
	1    5500 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 58BED4CA
P 5300 7550
F 0 "#PWR029" H 5300 7300 50  0001 C CNN
F 1 "GND" H 5305 7377 50  0000 C CNN
F 2 "" H 5300 7550 50  0000 C CNN
F 3 "" H 5300 7550 50  0000 C CNN
	1    5300 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 7550 5400 7550
Wire Wire Line
	5300 7250 5300 7550
Wire Wire Line
	5300 7350 5400 7350
Connection ~ 5300 7550
Connection ~ 5300 7350
Wire Wire Line
	5400 7250 5300 7250
$Comp
L +3V3 #PWR030
U 1 1 58BEDD12
P 5250 7150
F 0 "#PWR030" H 5250 7000 50  0001 C CNN
F 1 "+3V3" H 5265 7323 50  0000 C CNN
F 2 "" H 5250 7150 50  0000 C CNN
F 3 "" H 5250 7150 50  0000 C CNN
	1    5250 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 7150 5400 7150
$Comp
L +3V3 #PWR031
U 1 1 58BEE50F
P 5400 6550
F 0 "#PWR031" H 5400 6400 50  0001 C CNN
F 1 "+3V3" H 5415 6723 50  0000 C CNN
F 2 "" H 5400 6550 50  0000 C CNN
F 3 "" H 5400 6550 50  0000 C CNN
	1    5400 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6550 5400 6600
Wire Wire Line
	5400 6600 5500 6600
Text Label 5500 6700 2    60   ~ 0
~RST
Text Label 6400 7550 0    60   ~ 0
~RST
Wire Wire Line
	1300 3900 1400 3900
Wire Wire Line
	1350 3900 1350 3950
Wire Wire Line
	1400 3900 1400 3850
Connection ~ 1350 3900
Wire Wire Line
	1400 3750 1300 3750
Wire Wire Line
	1300 3750 1300 3900
Text Label 5900 4900 2    60   ~ 0
RMII_RXD1
Text Label 5900 5000 2    60   ~ 0
RMII_RXD0
Text Label 5900 5100 2    60   ~ 0
RMII_CRS_DV
Text Label 5900 5200 2    60   ~ 0
RMII_REF_CLK
Text Label 5900 5400 2    60   ~ 0
RMII_TXEN
Text Label 5900 5500 2    60   ~ 0
RMII_TXD1
Text Label 5900 5600 2    60   ~ 0
RMII_TXD0
Text Label 5900 5700 2    60   ~ 0
TRAFFIC_LED
Text Label 5900 5900 2    60   ~ 0
RMII_MDIO
Text Label 5900 6000 2    60   ~ 0
RMII_MDC
Text Label 4500 5000 2    60   ~ 0
RMII_RXD1
Text Label 4500 5100 2    60   ~ 0
RMII_RXD0
Text Label 4500 5200 2    60   ~ 0
RMII_CRS_DV
Text Label 4500 5300 2    60   ~ 0
RMII_REF_CLK
Text Label 4500 5500 2    60   ~ 0
RMII_TXEN
Text Label 4500 5600 2    60   ~ 0
RMII_TXD1
Text Label 4500 5700 2    60   ~ 0
RMII_TXD0
Text Label 4500 5800 2    60   ~ 0
TRAFFIC_LED
Text Label 4500 6000 2    60   ~ 0
RMII_MDIO
Text Label 4500 6100 2    60   ~ 0
RMII_MDC
$Comp
L 25AA02E48 IC3
U 1 1 58BFC0D2
P 6150 4150
F 0 "IC3" H 6150 4575 50  0000 C CNN
F 1 "25AA02E48" H 6150 4484 50  0000 C CNN
F 2 "agg:SOT-23-6" H 5950 3750 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20002123F.pdf" H 5950 3650 50  0001 L CNN
F 4 "1700995" H 5950 3550 50  0001 L CNN "Farnell"
	1    6150 4150
	1    0    0    -1  
$EndComp
$Comp
L C C17
U 1 1 58BFD26C
P 5600 4000
F 0 "C17" H 5650 4100 50  0000 L CNN
F 1 "100n" H 5650 3900 50  0000 L CNN
F 2 "agg:0603" H 5638 3850 50  0001 C CNN
F 3 "" H 5600 4000 50  0000 C CNN
	1    5600 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3850 5850 3850
Wire Wire Line
	5850 3850 5850 3950
Wire Wire Line
	5600 4150 5850 4150
Wire Wire Line
	5850 4150 5850 4050
$Comp
L +3V3 #PWR032
U 1 1 58BFD9B9
P 5600 3850
F 0 "#PWR032" H 5600 3700 50  0001 C CNN
F 1 "+3V3" H 5615 4023 50  0000 C CNN
F 2 "" H 5600 3850 50  0000 C CNN
F 3 "" H 5600 3850 50  0000 C CNN
	1    5600 3850
	1    0    0    -1  
$EndComp
Connection ~ 5600 3850
$Comp
L GND #PWR033
U 1 1 58BFDAC2
P 5600 4150
F 0 "#PWR033" H 5600 3900 50  0001 C CNN
F 1 "GND" H 5605 3977 50  0000 C CNN
F 2 "" H 5600 4150 50  0000 C CNN
F 3 "" H 5600 4150 50  0000 C CNN
	1    5600 4150
	1    0    0    -1  
$EndComp
Connection ~ 5600 4150
Text Label 6450 3950 0    60   ~ 0
ROM_CS
Text Label 6450 4050 0    60   ~ 0
ROM_SCK
Text Label 6450 4150 0    60   ~ 0
ROM_MISO
Text Label 6450 4250 0    60   ~ 0
ROM_MOSI
Text Label 4050 4250 0    60   ~ 0
ROM_CS
Text Label 4050 4350 0    60   ~ 0
ROM_SCK
Text Label 4050 4450 0    60   ~ 0
ROM_MISO
Text Label 4050 4550 0    60   ~ 0
ROM_MOSI
Wire Wire Line
	8800 4550 9400 4550
Wire Wire Line
	9400 4550 9400 4500
Wire Wire Line
	9900 4050 9900 5150
$Comp
L Crystal Y3
U 1 1 58D594BB
P 4650 3000
F 0 "Y3" V 4604 3131 50  0000 L CNN
F 1 "32.768k" V 4695 3131 50  0000 L CNN
F 2 "footprints:XTAL_1206" H 4650 3000 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1883680.pdf" H 4650 3000 50  0001 C CNN
F 4 "2101347" H 4650 3000 60  0001 C CNN "Farnell"
	1    4650 3000
	0    1    1    0   
$EndComp
$Comp
L C C44
U 1 1 58D5A687
P 4100 3350
F 0 "C44" H 4150 3450 50  0000 L CNN
F 1 "15p" H 4150 3250 50  0000 L CNN
F 2 "agg:0603" H 4138 3200 50  0001 C CNN
F 3 "" H 4100 3350 50  0001 C CNN
	1    4100 3350
	1    0    0    -1  
$EndComp
$Comp
L C C45
U 1 1 58D5C5AE
P 4350 3350
F 0 "C45" H 4400 3450 50  0000 L CNN
F 1 "15p" H 4400 3250 50  0000 L CNN
F 2 "agg:0603" H 4388 3200 50  0001 C CNN
F 3 "" H 4350 3350 50  0001 C CNN
	1    4350 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 58D5CD9D
P 4100 3500
F 0 "#PWR034" H 4100 3250 50  0001 C CNN
F 1 "GND" H 4105 3327 50  0000 C CNN
F 2 "" H 4100 3500 50  0001 C CNN
F 3 "" H 4100 3500 50  0001 C CNN
	1    4100 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 58D5CE67
P 4350 3500
F 0 "#PWR035" H 4350 3250 50  0001 C CNN
F 1 "GND" H 4355 3327 50  0000 C CNN
F 2 "" H 4350 3500 50  0001 C CNN
F 3 "" H 4350 3500 50  0001 C CNN
	1    4350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3150 4650 3150
Wire Wire Line
	4100 3150 4100 3200
Connection ~ 4100 3150
Wire Wire Line
	3750 3050 4350 3050
Wire Wire Line
	4350 2850 4350 3200
Wire Wire Line
	4350 2850 4650 2850
Connection ~ 4350 3050
$Comp
L MICROUSB J2
U 1 1 58D60DAE
P 5850 1350
F 0 "J2" H 5931 1775 50  0000 C CNN
F 1 "MICROUSB" H 5931 1684 50  0000 C CNN
F 2 "agg:MICROUSB_MOLEX_47589-0001" H 5700 850 50  0001 L CNN
F 3 "" H 6150 1550 50  0001 C CNN
F 4 "1568023" H 5700 750 50  0001 L CNN "Farnell"
	1    5850 1350
	1    0    0    -1  
$EndComp
Text Label 6850 1150 0    60   ~ 0
USB_VBUS
Text Label 6150 1250 0    60   ~ 0
USB_D-
Text Label 6150 1350 0    60   ~ 0
USB_D+
$Comp
L GND #PWR036
U 1 1 58D582F5
P 6300 1700
F 0 "#PWR036" H 6300 1450 50  0001 C CNN
F 1 "GND" H 6305 1527 50  0000 C CNN
F 2 "" H 6300 1700 50  0001 C CNN
F 3 "" H 6300 1700 50  0001 C CNN
	1    6300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1550 6300 1550
Wire Wire Line
	6300 1550 6300 1700
NoConn ~ 6150 1650
NoConn ~ 6150 1450
Text Label 4150 6250 0    60   ~ 0
USB_D-
Text Label 4150 6350 0    60   ~ 0
USB_D+
Text Label 4150 6450 0    60   ~ 0
USB_VBUS
$Comp
L R R29
U 1 1 58D5A526
P 6700 1150
F 0 "R29" V 6493 1150 50  0000 C CNN
F 1 "10k" V 6584 1150 50  0000 C CNN
F 2 "agg:0603" V 6630 1150 50  0001 C CNN
F 3 "" H 6700 1150 50  0001 C CNN
	1    6700 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 1150 6550 1150
$Comp
L TEST TP1
U 1 1 58D6D0D0
P 10550 900
F 0 "TP1" H 10628 1040 50  0000 L CNN
F 1 "+3.3V" H 10628 949 50  0000 L CNN
F 2 "agg:SIL-254P-01" H 10550 900 50  0001 C CNN
F 3 "" H 10550 900 50  0001 C CNN
	1    10550 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 900  10550 1000
Connection ~ 10550 1000
$Comp
L TEST TP2
U 1 1 58D706B5
P 1200 3450
F 0 "TP2" H 1278 3590 50  0000 L CNN
F 1 "RESET" H 1278 3499 50  0000 L CNN
F 2 "agg:SIL-254P-01" H 1200 3450 50  0001 C CNN
F 3 "" H 1200 3450 50  0001 C CNN
	1    1200 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 3450 1200 3550
Connection ~ 1200 3550
$EndSCHEMATC
