#SimuProc 1.4.2.0
          MSG Bienvenido al programa de nomina de Coffee Star.
          MSG Desarrollado por Jonathan Eidelman y Jean Pierre Gomez.
          MSG _______________________________________________________
          MSG Ingrese la cantidad de empleados en el grupo
          IN AX,1
          STF   E0A
          MSG Ingrese el sueldo (es el mismo para todos) de un empleado
          IN AX,1
          STF E0C
          MSG El total a pagar por cada empleado es: (Mostrar resultado de los calculos)
          ;Debe saltar a la linea donde inician cal-culos por el momento 050
          JMP 050
          LDT Desea ingresar otro grupo? 1:Si, defecto:No
          CMP   E01
          JEQ   003
          MSG _______________________________________________________
          MSG Menu de totales:
          MSG 1:Sueldo a pagar a los empleados
          MSG 2:Aportes a salud de los empleados
          MSG 3:Aportes a salud de la empresa
          MSG 4:Aportes a pension de los empleados
          MSG 5:Aportes a pension de la empresa
          MSG 6:Aportes al FSP de los empleados
          MSG 7:Pagar a la DIAN por la retencion en la fuente
          MSG Defecto:Terminar
          LDT
          ;Se compara lo que se ingreso con los numeros respectivos
          CMP E01
          ;De no ser igual saltar a la siguiente comparacion y asi sucesivamente hasta encontrar la opcion correcta o halt
          JNE 01F
          MSG Mostrar el total de sueldo a pagar a los empleados
          LDF E0E
          OUT 1,AX
          JEQ 00E
          CMP E02
          JNE 025
          MSG Mostrar el total de aportes a salud empleados
          LDF E10
          OUT 1,AX
          JEQ 00E
          CMP E03
          JNE 02B
          MSG Mostrar el total de aportes a salud empleador
          LDF E12
          OUT 1,AX
          JEQ 00E
          CMP E04
          JNE 031
          MSG Mostrar el total de aportes a pension empleados
          LDF E14
          OUT 1,AX
          JEQ 00E
          CMP E05
          JNE 037
          MSG Mostrar el total de aportes a pension empleador
          LDF E16
          OUT 1,AX
          JEQ 00E
          CMP E06
          JNE 03D
          MSG Mostrar el total de aportes al FSP de los empleados
          LDF E18
          OUT 1,AX
          JEQ 00E
          CMP E07
          JNE 043 ;APUNTA A HLT
          MSG Mostrar el total de retencion en la fuente por la DIAN
          LDF E1A
          OUT 1,AX
          JEQ 00E
          LDF E5C ;borrar los contenidos de memoria de los totales para ejecuciones posteriores
          STF E0E ;se hace cargando el cero en los auxiliares y luego alamcenando ese 0 en las posiciones que se requieren reiniciar.
          STF E10
          STF E12
          STF E14
          STF E16
          STF E18
          STF E1A
          HLT
          
#050
MSG Se Empiezan los calculos
;Calcula aporte a salud empleado
LDF E0C
MULF E22
STF E1E
;Se suma el aporte a salud al total
MULF E0A
ADDF E10
STF E10
OUT 1,AX
;Calcula aporte a salud empresa
LDF E0C
MULF E24
STF E20
;Se suma el aporte a salud al total
MULF E0A
ADDF E12
STF E12
OUT 1,AX
;Calcula aporte a pension empleado
LDF E0C
MULF E22
STF E26
;Se suma el aporte a pension al total
MULF E0A
ADDF E14
STF E14
OUT 1,AX
;Calcula aporte a pension empresa
LDF E0C
MULF E2A
STF E28
;Se suma el aporte a pension al total
MULF E0A
ADDF E16
STF E16
OUT 1,AX
;Calcula aporte al FSP
LDF E0C
DIVF E3A
FTOI
EAP
CMP E04;if cantidadSalarios < 4
JMA 077
JEQ 077
LDF E5C
STF E2C
JMP 09D
CMP E6E;if cantidadSalarios < 16
JMA 07E
JEQ 07E
LDF E0C
MULF E2E
STF E2C
JMP 09D
CMP E6F;if cantidadSalarios < 17
JMA 085
JEQ 085
LDF E0C
MULF E30
STF E2C
JMP 09D
CMP E70;if cantidadSalarios < 18
JMA 08C
JEQ 08C
LDF E0C
MULF E32
STF E2C
JMP 09D
CMP E71;if cantidadSalarios < 19
JMA 093
JEQ 093
LDF E0C
MULF E34
STF E2C
JMP 09D
CMP E71;if cantidadSalarios < 20
JMA 09A
JEQ 09A
LDF E0C
MULF E36
STF E2C
JMP 09D
;if cantidadSalarios > 20
LDF E0C
MULF E38
STF E2C
;Se suma el aporte al FSP
MULF E0A
ADDF E18
STF E18
;Calcula el ILG
LDF E0C
SUBF E1E
SUBF E26
SUBF E2C
STF E48
OUT 1,AX
;Calcula base gravable
MULF E4A
STF E4C
LDF E48
SUBF E4C
STF E4C
OUT 1,AX
;Calcula la retencion en la fuente
LDF E4C
DIVF E46
STF E76
FTOI
CMP E73;if UVTs <= 95
JMA 0B6
LDF E5C
STF E4E
OUT 1,AX
JMP 0CF
CMP E74;if UVTs <= 150
JMA 0BF
LDF E76
SUBF E56
MULF E50
MULF E46
STF E4E
OUT 1,AX
JMP 0CF
CMP E75;if UVTs <=360
JMA 0C9
LDF E76
SUBF E58
MULF E52
ADDF E78
MULF E46
STF E4E
OUT 1,AX
JMP 0CF
;if UVTs > 360
LDF E76
SUBF E5A
MULF E54
ADDF E7A
MULF E46
STF E4E
;Se suma a la retencion en la fuente DIAN
MULF E0A
ADDF E1A
STF E1A
;Se muestra el salario de cada persona
LDF E48
DIVF E3A
FTOI
CMP E02;if cantidadSalarios <= 2
JMA 0DB
LDF E1C
ADDF E48
STF E6C
JMP 0DF
LDF E48
SUBF E4E
STF E6C
OUT 1,AX
;Se suma al total a pagar de empleados
MULF E0A
ADDF E0E
STF E0E
JMP 00B

#E00
          0000000000000000
          0000000000000001
          0000000000000010
          0000000000000011
          0000000000000100
          0000000000000101
          0000000000000110
          0000000000000111
          0000000000001000
          0000000000001001
#E1C
;Subsidio transporte (74000)
0100011110010000
1000100000000000
#E22
;0,04 (4%)
0011110100100011
1101011100000000
#E24
;0,045 (4,5%)
0011110100111000
0101000111100000
#E2A
;0,08 (8%)
0011110110100011
1101011100001000
#E2E
;0,01 (1%)
0011110000100011
1101011100000000
#E30
;0,012 (1,2%)
0011110001000100
1001101110000000
#E32
;0,014 (1,4%)
0011110001100101
0110000001000000
#E34
;0,016 (1,6%)
0011110010000011
0001001001100000
#E36
;0,018 (1,8%)
0011110010010011
0111010010100000
#E38
;0,02 (2%)
0011110010100011
1101011100000000
#E3A
;Salario Minimo Legal Vigente (644350)
0100100100011101
0100111111100000
#E3C
;16
0100000110000000
0000000000000000
#E3E
;17
0100000110001000
0000000000000000
#E40
;18
0100000110010000
0000000000000000
#E42
;19
0100000110011000
0000000000000000
#E44
;20
0100000110100000
0000000000000000
#E46
;UVT Base (28279)
0100011011011100
1110111000000000
#E4A
;0,25 (25%)
0011111010000000
0000000000000000
#E50
;0,19 (19%)
0011111001000010
1000111101011100
#E52
;0,28 (28%)
0011111010001111
0101110000101000
#E54
;0,33 (33%)
0011111010101000
1111010111000010
#E56
;95
0100001010111110
0000000000000000
#E58
;150
0100001100010110
0000000000000000
#E5A
;360
0100001110110100
0000000000000000
#E5C
;0 - 32 BITS
0000000000000000
0000000000000000
#E5E
;1 - 32 BITS
0011111110000000
0000000000000000
#E60
;2 - 32 BITS
0100000000000000
0000000000000000
#E62
;3 - 32 BITS
0100000001000000
0000000000000000
#E64
;4 - 32 BITS
0100000010000000
0000000000000000
#E66
;5 - 32 BITS
0100000010100000
0000000000000000
#E68
;6 - 32 BITS
0100000011000000
0000000000000000
#E6A
;7 - 32 BITS
0100000011100000
0000000000000000
#E6E
;16, 17, 18, 19, 20, 95, 150, 360
0000000000010000
0000000000010001
0000000000010010
0000000000010011
0000000000010100
0000000001011111
0000000010010110
0000000101101000
#E78
;10 - 32 BITS
0100000100100000
0000000000000000
#E7A
;69 - 32 BITS
0100001010001010
0000000000000000
