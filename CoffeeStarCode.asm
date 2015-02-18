#SimuProc 1.4.2.0
          MSG Bienvenido al programa de nomina de Coffee Star.
          MSG Desarrollado por Jonathan Eidelman y Jean Pierre Gomez.
          MSG _______________________________________________________
          MSG Ingrese la cantidad de empleados en el grupo
          IN AX,1
          STF   E0A ;se almacena la cantidad de empleados en dicha posicion.
          MSG Ingrese el sueldo (es el mismo para todos) de un empleado
          IN AX,1   ;se almacena el sueldo de los empleados de ese grupo en dicha posicion.
          STF E0C
          MSG El total a pagar por cada empleado es: (Mostrar resultado de los calculos)
          ;Debe saltar a la linea donde inician calculos por el momento 050
          JMP 050
          LDT Desea ingresar otro grupo? 1:Si, defecto:No
          CMP   E01  ;compara el numero ingresado con 1
          JEQ   003  ;en caso de que sea 1 salta al menu donde pregunta la cantidad de empleados y su salario.
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
          LDT ;lee la opcion que el usuario desea realizar.
          ;Se compara lo que se ingreso con los numeros respectivos
          CMP E01 ;compara con 1
          ;De no ser igual saltar a la siguiente comparacion y asi sucesivamente hasta encontrar la opcion correcta o halt
          JNE 01F ;si no es igual salta a la siguiente comparacion.
          MSG Mostrar el total de sueldo a pagar a los empleados
          LDF E0E ;trae la informacion preguntada por el usuario y la muestra.
          OUT 1,AX
          JEQ 00E ;regresa al menu para ver que mas desea hacer el usuario.
          CMP E02 ;compara con el 2.
          JNE 025 ;de no ser igual salta a la siguiente comparacion.
          MSG Mostrar el total de aportes a salud empleados
          LDF E10 ;carga la informacion preguntada por el usuario y la muestra.
          OUT 1,AX
          JEQ 00E ;regresa al menu para ver que mas desea hacer el usuario.
          CMP E03 ;compara con el 3, de no ser igual salta a la siguiente comparacion.
          JNE 02B
          MSG Mostrar el total de aportes a salud empleador
          LDF E12 ;carga la informacion que el usuario desea ver y la muestra.
          OUT 1,AX
          JEQ 00E ;salta al menu para ver que mas desea hacer el usuario.
          CMP E04 ;compara con la opcion 4.
          JNE 031 ;de no ser igual salta a la siguiente comparacion.
          MSG Mostrar el total de aportes a pension empleados
          LDF E14 ;carga la informacion que el usuario desea ver y la muestra.
          OUT 1,AX
          JEQ 00E ;salta al menu para ver que mas desea hacer el usuario.
          CMP E05 ;compara con el 5.
          JNE 037 ;de no ser igual pasa a la siguiente comparacion.
          MSG Mostrar el total de aportes a pension empleador
          LDF E16 ;carga la informacion que el usuario desea ver.
          OUT 1,AX ;muestra la informacion cargada.
          JEQ 00E ;salta al menu para ver que mas desea hacer el usuario.
          CMP E06 ;compara con la opcion 6.
          JNE 03D ;de no ser igual salta a la siguiente opcion
          MSG Mostrar el total de aportes al FSP de los empleados
          LDF E18 ;carga la informacion que el usuario desea ver y la muestra.
          OUT 1,AX
          JEQ 00E ;salta al menu para ver que mas desea hacer el usuario.
          CMP E07 ;compara con la opcion 7
          JNE 043 ;APUNTA A HLT-----si la opcion ingresada no fue ni [1-7] entonces el usuario desea terminar y va al halt
          MSG Mostrar el total de retencion en la fuente por la DIAN
          LDF E1A ;carga la informacion que desea ver el usuario y la muestra.
          OUT 1,AX
          JEQ 00E ;salta al menu para ver si el usuario desea ver algo mas.
          LDF E5C ;borrar los contenidos de memoria de los totales para ejecuciones posteriores --- carga el 0
          STF E0E ;se almacena el 0 en esa variable que hay que reiniciar
          STF E10  ;se almacena el 0 en esa variable que hay que reiniciar
          STF E12 ;se almacena el 0 en esa variable que hay que reiniciar
          STF E14 ;se almacena el 0 en esa variable que hay que reiniciar
          STF E16 ;se almacena el 0 en esa variable que hay que reiniciar
          STF E18 ;se almacena el 0 en esa variable que hay que reiniciar
          STF E1A ;se almcaena el 0 en esa variable que hay que reiniciar
          HLT
          
#050 ;apartir de aqui se hacen los calculos.
MSG Se Empiezan los calculos
;Calcula aporte a salud empleado
LDF E0C ;se carga el sueldo de la persona
MULF E22;se multiplica por 4%
STF E1E ;se almacena ese resultado en esa posicion de memoria.
;Se suma el aporte a salud al total
MULF E0A ;multiplicamos el aporte a la salud por la cantidad de personas en el grupo
ADDF E10 ;y lo sumamos con el total que se habia calculado hasta ahora de todos los otros grupos
STF E10  ;almacenamos ese resultado en la posicion correspondiente al total de aportes a salud del empleado
OUT 1,AX 
;Calcula aporte a salud empresa
LDF E0C ;se carga el sueldo de la persona
MULF E24 ;se multiploca por 4.5%
STF E20 ;se almacena en la variable correspondiente
;Se suma el aporte a salud al total
MULF E0A ;multiplicamos por la cantidad de personas en el grupo
ADDF E12 ;sumamos ese resultado a lo que habia antes en el total por este ambito
STF E12  ;se actualiza el valor de la variable total
OUT 1,AX
;Calcula aporte a pension empleado
LDF E0C ;carga el sueldo del empleado
MULF E22 ;lo multiplica por 4%
STF E26  ;lo almacena en la variable correspondiente
;Se suma el aporte a pension al total
MULF E0A ;multiplicamos por la cantidad de empleados en ese grupo
ADDF E14 ;lo sumamos al valor actual total de ese concepto
STF E14 ;realmacenamos el valor actualizado.
OUT 1,AX
;Calcula aporte a pension empresa
LDF E0C ;se carga el sueldo de la persona
MULF E2A ;se multiplica por 8%
STF E28  ;se guarda en la variable correspondiente
;Se suma el aporte a pension al total
MULF E0A ;multiplicamos por la cantidad de personas en el grupo
ADDF E16 ;sumamos al valor total que se tenia hasta el momento
STF E16  ;se actualiza el valor total
OUT 1,AX
;Calcula aporte al FSP
LDF E0C ;se carga el sueldo del empleado
DIVF E3A ;se divide por un minimo para saber cuandos SMLMV gana la persona
FTOI ;se pasa el valor a entero para hacer las comparaciones.
EAP
CMP E04;if cantidadSalarios < 4
JMA 077 ;de ser mayor o igual a 4 salta a la siguiente comparacion
JEQ 077
LDF E5C ;carga el valor correspondiente a pagar por el FSP
STF E2C ;almacena la informacion en la variable 
JMP 09D ;se salta a donde actualizara los totales del FSP
CMP E6E;if cantidadSalarios < 16
JMA 07E;de ser mayor o igual pasa a la siguiente comparacion
JEQ 07E
LDF E0C ;carga el sueldo del empleado
MULF E2E ;lo multiplica por el porcentaje correspondiente
STF E2C ;almacena el resultado en memoria.
JMP 09D ;salta a donde se actualizara los totales del FSP
CMP E6F;if cantidadSalarios < 17
JMA 085;de ser mayor o igual salta a la siguiente comparacion
JEQ 085
LDF E0C ;carga el sueldo del empleado
MULF E30 ;lo multiplica por el porcentaje correspondiente al rango
STF E2C ;almacena el resultado en memoria
JMP 09D ;salta a la parte en donde se actualizara los totales del FSP
CMP E70;if cantidadSalarios < 18
JMA 08C ;de ser mayor o igual va a la siguiente comparacion
JEQ 08C
LDF E0C ;carga el sueldo del empleado
MULF E32 ;lo multiploca por el porcentaje correspondiente
STF E2C ;almacena el resultado en memoria.
JMP 09D ;salta a donde se actualiza el total del FSP
CMP E71;if cantidadSalarios < 19
JMA 093 ;de ser mayor o igual salta a la siguiente comparacion
JEQ 093
LDF E0C ;carga el sueldo del empleado
MULF E34;lo multiplica por el porcentaje correspondiente.
STF E2C ;almacena el reusltado en meomria
JMP 09D ;salta a donde se actualizara los totales del FSP
CMP E71;if cantidadSalarios < 20
JMA 09A ;de ser mayor o igual salta al ultimo intervalo
JEQ 09A
LDF E0C ;carga el sueldo del empleado
MULF E36 ;lo multiplica por el porcentaje correspondiente.
STF E2C ;almacena el resultado en memoria.
JMP 09D ;salta a donde se actualizan los totales del FSP
;if cantidadSalarios > 20
LDF E0C ;si no estuvo en ningun rango anterior - carga el sueldo del empleado
MULF E38 ;lo multiplica por el porcentaje correspondiente
STF E2C ;almacena el resultado
;Se suma el aporte al FSP
MULF E0A ;multiploca el resultaod por la cantidad de empleados en el grupo
ADDF E18 ;lo suma al total del FSP que se tenia
STF E18 ;almacena el nuevo total para actualizar el dato
;Calcula el ILG
LDF E0C ;carga el sueldo del emppleado
SUBF E1E ;le resta el aporte a la salud del empleado
SUBF E26 ;le resta el aporte a la pension del empleado
SUBF E2C ;le resta el aporte al FSP del empleado
STF E48 ;almcaena el resultado en memoria
OUT 1,AX
;Calcula base gravable
MULF E4A ;multiploca la ILG por 25%
STF E4C ;lo almacena en memora
LDF E48 ;lee el ILG
SUBF E4C ;le resta el 25% del ILG para obtener la base gravable
STF E4C ;almacena la base gravable
OUT 1,AX
;Calcula la retencion en la fuente
LDF E4C ;carga la base gravable
DIVF E46 ;pasa la base gravable a UVT 
STF E76 ;almacena el dato en memoria
FTOI ;lo pasa a entero para hacer las comparaciones
CMP E73;if UVTs <= 95
JMA 0B6 ;si es mayor salta a la siguiente comparacion
LDF E5C ;carga el 0
STF E4E ;lo almacena en memoria
OUT 1,AX
JMP 0CF ;salta a donde se actualiza el total de la retencion en la fuente.
CMP E74;if UVTs <= 150
JMA 0BF ;de ser mayor salta a la siguiente comparacion
LDF E76 ;carga la base gravable en UVT
SUBF E56 ;resta 95 a a la Base gravable en UVT
MULF E50 ;lo multiploca por 19%
MULF E46 ;lo multiplica por el valor de la UVT para pasarlo a pesos
STF E4E ;almacena el resultado
OUT 1,AX
JMP 0CF ;salta a donde se actualiza el resultado de la retencion en la fuente.
CMP E75;if UVTs <=360
JMA 0C9 ;de ser mayor salta a la siguiente comparacion
LDF E76 ;carga la base gravable en uvt
SUBF E58 ;le resta 150
MULF E52 ;lo multiplica por 28%
ADDF E78 ;le suma 10 ;;;;;; ojo aqui puede estar ERROR!!!
MULF E46 ;lo multiplica por el valor de la UVT para pasarlo a pesos
STF E4E ;almacena el dato en memoria
OUT 1,AX
JMP 0CF ;salta a donde actualiza los totales de la retencion en la fuente
;if UVTs > 360 ;si ni estaba en ninguno de los anteriores intervalos entra aca
LDF E76 ;carga la base gravable en UVT
SUBF E5A ;le resta 350
MULF E54 ;lo multiplica por 33%
ADDF E7A ;le suma 69 ;;;;; OJO AQUI PUEDE ESTAR EL ERROR!!!
MULF E46 ;lo multiplica por el valor de la UVT para pasarlo a pesos
STF E4E ;almacena el dato
;Se suma a la retencion en la fuente DIAN
MULF E0A ;multiplica por la cantidad de personas en el grupo
ADDF E1A ;lo suma al total anterior para obtener el dato actualizado
STF E1A ;almacena el dato actualizado
;Se muestra el salario de cada persona
LDF E48 ;carga el ILG
DIVF E3A ;lo divide por el salario minimo
FTOI ; lo pasa a entero
CMP E02;if cantidadSalarios <= 2
JMA 0DB ;si es mayor que 2 no debe pagar el subisidio de transporte
LDF E1C ;de serlo carga el subsidio de transporte
ADDF E48 ;se lo suma al sueldo
STF E6C ;almacena el dato
JMP 0DF ;salta a donde imprime el dato
LDF E48 ;AQUI LLEGA SI NO LO DEBE PAGAR carga el ILG
SUBF E4E ;le resta la retencion en la fuente
STF E6C ;almacena el dato
OUT 1,AX
;Se suma al total a pagar de empleados
MULF E0A ;multiplica por el numero de empleados
ADDF E0E ;lo suma al total anterior
STF E0E ;actualiza el dato ya calculado nuevamente
JMP 00B ;regresa a una linea despues de donde fue llamado para hacer los calculos para continuar con el flujo del programa

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
