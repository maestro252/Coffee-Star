#SimuProc 1.4.2.0
          MSG Bienvenido al programa de nomina de Coffee Star.
          MSG Desarrollado por Jonathan Eidelman y Jean Pierre Gomez.
          MSG _______________________________________________________
          MSG Ingrese la cantidad de empleados en el grupo
          IN AX,1
          STF E0A ;Se almacena la cantidad de empleados en dicha posicion.
          MSG Ingrese el sueldo (es el mismo para todos) de un empleado
          IN AX,1 ;Se almacena el sueldo de los empleados de ese grupo en dicha posicion.
          STF E0C
          MSG El total a pagar por cada empleado es: (Mostrar resultado de los calculos)
          ;Debe saltar a la linea donde inician calculos por el momento 050
          JMP 050
          LDT Desea ingresar otro grupo? 1:Si, defecto:No
          CMP   E01 ;Compara el numero ingresado con 1
          JEQ   003 ;En caso de que sea 1 salta al menu donde pregunta la cantidad de empleados y su salario.
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
          LDT ;Lee la opcion que el usuario desea realizar.
          ;Se compara lo que se ingreso con los numeros respectivos
          CMP E01 ;Compara con 1
          ;De no ser igual saltar a la siguiente comparacion y asi sucesivamente hasta encontrar la opcion correcta o halt
          JNE 01F ;Si no es igual salta a la siguiente comparacion.
          MSG Mostrar el total de sueldo a pagar a los empleados
          LDF E0E ;Trae la informacion preguntada por el usuario y la muestra.
          OUT 1,AX
          JEQ 00E ;Regresa al menu para ver que mas desea hacer el usuario.
          CMP E02 ;Compara con el 2.
          JNE 025 ;De no ser igual salta a la siguiente comparacion.
          MSG Mostrar el total de aportes a salud empleados
          LDF E10 ;Carga la informacion preguntada por el usuario y la muestra.
          OUT 1,AX
          JEQ 00E ;Regresa al menu para ver que mas desea hacer el usuario.
          CMP E03 ;Compara con el 3, de no ser igual salta a la siguiente comparacion.
          JNE 02B
          MSG Mostrar el total de aportes a salud empleador
          LDF E12 ;Carga la informacion que el usuario desea ver y la muestra.
          OUT 1,AX
          JEQ 00E ;Salta al menu para ver que mas desea hacer el usuario.
          CMP E04 ;Compara con la opcion 4.
          JNE 031 ;De no ser igual salta a la siguiente comparacion.
          MSG Mostrar el total de aportes a pension empleados
          LDF E14 ;Carga la informacion que el usuario desea ver y la muestra.
          OUT 1,AX
          JEQ 00E ;Salta al menu para ver que mas desea hacer el usuario.
          CMP E05 ;Compara con el 5.
          JNE 037 ;De no ser igual pasa a la siguiente comparacion.
          MSG Mostrar el total de aportes a pension empleador
          LDF E16 ;Carga la informacion que el usuario desea ver.
          OUT 1,AX ;Muestra la informacion cargada.
          JEQ 00E ;Salta al menu para ver que mas desea hacer el usuario.
          CMP E06 ;Compara con la opcion 6.
          JNE 03D ;De no ser igual salta a la siguiente opcion
          MSG Mostrar el total de aportes al FSP de los empleados
          LDF E18 ;Carga la informacion que el usuario desea ver y la muestra.
          OUT 1,AX
          JEQ 00E ;Salta al menu para ver que mas desea hacer el usuario.
          CMP E07 ;Compara con la opcion 7
          JNE 043 ;APUNTA A HLT-----Si la opcion ingresada no fue ni [1-7] entonces el usuario desea terminar y va al halt
          MSG Mostrar el total de retencion en la fuente por la DIAN
          LDF E1A ;Carga la informacion que desea ver el usuario y la muestra.
          OUT 1,AX
          JEQ 00E ;Salta al menu para ver si el usuario desea ver algo mas.
          LDF E5C ;Borrar los contenidos de memoria de los totales para ejecuciones posteriores --- Carga el 0
          STF E0E ;Se almacena el 0 en esa variable que hay que reiniciar
          STF E10 ;Se almacena el 0 en esa variable que hay que reiniciar
          STF E12 ;Se almacena el 0 en esa variable que hay que reiniciar
          STF E14 ;Se almacena el 0 en esa variable que hay que reiniciar
          STF E16 ;Se almacena el 0 en esa variable que hay que reiniciar
          STF E18 ;Se almacena el 0 en esa variable que hay que reiniciar
          STF E1A ;Se almcaena el 0 en esa variable que hay que reiniciar
          HLT ;Termina la ejecuccion
          
#050
;Apartir de aqui se hacen los calculos.
MSG Se Empiezan los calculos
;Calcula aporte a salud empleado
LDF E0C ;Se carga el sueldo de la persona
MULF E22 ;Se multiplica por 4%
STF E1E ;Se almacena ese resultado en esa posicion de memoria.
;Se suma el aporte a salud al total
MULF E0A ;Multiplicamos el aporte a la salud por la cantidad de personas en el grupo
ADDF E10 ;Y lo sumamos con el total que se habia calculado hasta ahora de todos los otros grupos
STF E10 ;Almacenamos ese resultado en la posicion correspondiente al total de aportes a salud del empleado
OUT 1,AX 
;Calcula aporte a salud empresa
LDF E0C ;Se carga el sueldo de la persona
MULF E24 ;Se multiplica por 4.5%
STF E20 ;Se almacena en la variable correspondiente
;Se suma el aporte a salud al total
MULF E0A ;Multiplicamos por la cantidad de personas en el grupo
ADDF E12 ;Sumamos ese resultado a lo que habia antes en el total por este ambito
STF E12 ;Se actualiza el valor de la variable total
OUT 1,AX
;Calcula aporte a pension empleado
LDF E0C ;Carga el sueldo del empleado
MULF E22 ;Lo multiplica por 4%
STF E26 ;Lo almacena en la variable correspondiente
;Se suma el aporte a pension al total
MULF E0A ;Multiplicamos por la cantidad de empleados en ese grupo
ADDF E14 ;Lo sumamos al valor actual total de ese concepto
STF E14 ;Realmacenamos el valor actualizado.
OUT 1,AX
;Calcula aporte a pension empresa
LDF E0C ;Se carga el sueldo de la persona
MULF E2A ;Se multiplica por 8%
STF E28 ;Se guarda en la variable correspondiente
;Se suma el aporte a pension al total
MULF E0A ;Multiplicamos por la cantidad de personas en el grupo
ADDF E16 ;Sumamos al valor total que se tenia hasta el momento
STF E16 ;Se actualiza el valor total
OUT 1,AX
;Calcula aporte al FSP
LDF E0C ;Se carga el sueldo del empleado
DIVF E3A ;Se divide por un minimo para saber cuandos SMLMV gana la persona
MOV E7C,CX ;Guarda en E7C el residuo de la division y saber si la division es exacta
FTOI ;Se pasa el valor a entero para hacer las comparaciones.
STA E7E ;Almacenamos en esta posicion la cantidad entera de SMLMV que gana la persona
CMP E04 ;If cantidadSalarios < 4
JMA 078 ;De ser mayor a 4 salta a la siguiente comparacion
JEQ 078 ;De ser igual a 4 salta a la siguiente comparacion
LDF E5C ;Carga el valor correspondiente a pagar por el FSP
STF E2C ;Almacena la informacion en la variable
JMP 09E ;Se salta a donde actualizara los totales del FSP
CMP E6E ;If cantidadSalarios < 16
JMA 07F ;De ser mayor a 16 salta a la siguiente comparacion
JEQ 07F ;De ser igual a 16 salta a la siguiente comparacion
LDF E0C ;Carga el sueldo del empleado
MULF E2E ;Lo multiplica por el porcentaje correspondiente
STF E2C ;Almacena el resultado en memoria.
JMP 09E ;Salta a donde se actualizara los totales del FSP
CMP E6F ;If cantidadSalarios < 17
JMA 086 ;De ser mayor a 17 salta a la siguiente comparacion
JEQ 086 ;De ser igual a 17 salta a la siguiente comparacion
LDF E0C ;Carga el sueldo del empleado
MULF E30 ;Lo multiplica por el porcentaje correspondiente al rango
STF E2C ;Almacena el resultado en memoria
JMP 09E ;Salta a la parte en donde se actualizara los totales del FSP
CMP E70 ;If cantidadSalarios < 18
JMA 08D ;De ser mayor a 18 salta a la siguiente comparacion
JEQ 08D ;De ser igual a 18 salta a la siguiente comparacion
LDF E0C ;Carga el sueldo del empleado
MULF E32 ;Lo multiploca por el porcentaje correspondiente
STF E2C ;Almacena el resultado en memoria.
JMP 09E ;Salta a donde se actualiza el total del FSP
CMP E71 ;If cantidadSalarios < 19
JMA 094 ;De ser mayor a 19 salta a la siguiente comparacion
JEQ 094 ;De ser igual a 19 salta a la siguiente comparacion
LDF E0C ;Carga el sueldo del empleado
MULF E34 ;Lo multiplica por el porcentaje correspondiente.
STF E2C ;Almacena el reusltado en meomria
JMP 09E ;Salta a donde se actualizara los totales del FSP
CMP E72 ;If cantidadSalarios < 20
JMA 09B ;De ser mayor salta al ultimo intervalo
JEQ 09B ;De ser igual salta al ultimo intervalo
LDF E0C ;Carga el sueldo del empleado
MULF E36 ;Lo multiplica por el porcentaje correspondiente.
STF E2C ;Almacena el resultado en memoria.
JMP 09E ;Salta a donde se actualizan los totales del FSP
;If cantidadSalarios > 20
LDF E0C ;Si no estuvo en ningun rango anterior - Carga el sueldo del empleado
MULF E38 ;Lo multiplica por el porcentaje correspondiente
STF E2C ;Almacena el resultado
;Se suma el aporte al FSP
MULF E0A ;Multiplica el resultado por la cantidad de empleados en el grupo
ADDF E18 ;Lo suma al total del FSP que se tenia
STF E18 ;Almacena el nuevo total para actualizar el dato
;Calcula el ILG
LDF E0C ;Carga el sueldo del empleado
SUBF E1E ;Le resta el aporte a la salud del empleado
SUBF E26 ;Le resta el aporte a la pension del empleado
SUBF E2C ;Le resta el aporte al FSP del empleado
STF E48 ;Almacena el resultado en memoria
OUT 1,AX
;Calcula base gravable
MULF E4A ;Multiploca la ILG por 25%
STF E4C ;Lo almacena en memoria
LDF E48 ;Lee el ILG
SUBF E4C ;le resta el 25% del ILG para obtener la base gravable
STF E4C ;Almacena la base gravable
OUT 1,AX
;Calcula la retencion en la fuente
LDF E4C ;Carga la base gravable
DIVF E46 ;Pasa la base gravable a UVT
STF E76 ;Almacena el dato en memoria
MOV E7D,CX ;Guarda en E7D el residuo de la division y saber si la division es exacta
FTOI ;Lo pasa a entero para hacer las comparaciones
STA E7F ;Almacena en memoria la parte entera de la base graable en UVTs
CMP E73 ;If UVTs <= 95
JME 0B9 ;Saltar a calculos si es menor a 95
JMA 0BD ;Si es mayor a 95 salta a la siguiente comparacion
LDA E7D ;Cargamos el residuo de la conversion a UVTs
CMP E00 ;Comparamos que el residuo sea 0
JMA 0BD ;Saltamos a la siguiente comparacion si el residuo es mayor a 0
LDF E5C ;Carga el 0
STF E4E ;Lo almacena en memoria como la retencion en la fuente
OUT 1,AX
JMP 0E0 ;Salta a donde se actualiza el total de la retencion en la fuente.
LDA E7F ;Carga el resultado entero de la division
CMP E74 ;If UVTs <= 150
JME 0C4 ;Saltar a calculos si es menor a 150
JMA 0CB ;De ser mayor a 150 salta a la siguiente comparacion
LDA E7D ;Cargamos el residuo de la conversion a UVTs
CMP E00 ;Comparamos que el residuo sea 0
JMA 0CB ;Saltar a la siguiente comparacion si el residuo es mayor a 0
LDF E76 ;Carga la base gravable en UVT
SUBF E56 ;Resta 95 a a la Base gravable en UVT
MULF E50 ;Lo multiploca por 19%
MULF E46 ;Lo multiplica por el valor de la UVT para pasarlo a pesos
STF E4E ;Almacena el resultado
OUT 1,AX
JMP 0E0 ;Salta a donde se actualiza el resultado de la retencion en la fuente.
LDA E7F ;Carga el resultado entero de la division
CMP E75 ;If UVTs <=360
JME 0D2 ;Saltar a calculos si es menor a 360
JMA 0DA ;De ser mayor a 360 salta a la siguiente comparacion
LDA E7D ;Cargamos el residuo de la conversion a UVTs
CMP E00 ;Comparamos que el residuo sea 0
JMA 0DA ;Saltar a la siguiente comparacion si el residuo es mayor a 0
LDF E76 ;Carga la base gravable en UVT
SUBF E58 ;Le resta 150
MULF E52 ;Lo multiplica por 28%
ADDF E78 ;Le suma 10
MULF E46 ;Lo multiplica por el valor de la UVT para pasarlo a pesos
STF E4E ;Almacena el dato en memoria
OUT 1,AX
JMP 0E0 ;Salta a donde actualiza los totales de la retencion en la fuente
;If UVTs > 360 ;Si no estaba en ninguno de los anteriores intervalos salta aca
LDF E76 ;Carga la base gravable en UVT
SUBF E5A ;Le resta 360
MULF E54 ;Lo multiplica por 33%
ADDF E7A ;Le suma 69
MULF E46 ;Lo multiplica por el valor de la UVT para pasarlo a pesos
STF E4E ;Almacena el dato
;Se suma a la retencion en la fuente DIAN
MULF E0A ;Multiplica por la cantidad de personas en el grupo
ADDF E1A ;Lo suma al total anterior para obtener el dato actualizado
STF E1A ;Almacena el dato actualizado
;Se muestra el salario de cada persona
LDA E7E ;Carga la cantidad de SMLMV que gana una persona
CMP E02 ;If cantidadSalarios <= 2
JME 0EA ;Salta a calculos si es menor a 2
JMA 0EF ;Si es mayor que 2 no se debe pagar el subisidio de transporte y saltamos
LDA E7C ;Carga el residuo del Salario sobre el valor de un SMLMV
CMP E00 ;Comparar si el residuo es igual a 0
JMA 0EF ;Saltar si el residuo es mayor a 0 y no pagar el subsidio de transporte
LDF E1C ;Carga el subsidio de transporte
ADDF E48 ;Se lo suma al sueldo
STF E6C ;Almacena el dato
OUT 1,AX
JMP 0F3 ;Salta para restarle la retencion en la fuente
LDF E48 ;Si no se le debe pagar subsidio de transporte - Carga el ILG
SUBF E4E ;Le resta la retencion en la fuente
STF E6C ;Almacena el dato
OUT 1,AX
;Se suma al total a pagar de empleados
MULF E0A ;Multiplica por el numero de empleados
ADDF E0E ;Lo suma al total anterior
STF E0E ;Actualiza el dato ya calculado nuevamente
JMP 00B ;Regresa a una linea despues de donde fue llamado para hacer los calculos para continuar con el flujo del programa

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
