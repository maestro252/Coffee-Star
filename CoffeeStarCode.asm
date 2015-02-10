#SimuProc 1.4.2.0
          MSG Bienvenido al programa de nomina de Coffee Star.
          MSG Desarrollado por Jonathan Eidelman y Jean Pierre Gomez.
          MSG _______________________________________________________
          LDT Ingrese la cantidad de empleados en el grupo
          STA   E0A
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
          JNE 01E
          MSG Mostrar el total de sueldo a pagar a los empleados
          LDF E0E
          OUT 1,AX
          JEQ 00D
          CMP E02
          JNE 024
          MSG Mostrar el total de aportes a salud empleados
          LDF E10
          OUT 1,AX
          JEQ 00D
          CMP E03
          JNE 02A
          MSG Mostrar el total de aportes a salud empleador
          LDF E12
          OUT 1,AX
          JEQ 00D
          CMP E04
          JNE 030
          MSG Mostrar el total de aportes a pension empleados
          LDF E14
          OUT 1,AX
          JEQ 00D
          CMP E05
          JNE 036
          MSG Mostrar el total de aportes a pension empleador
          LDF E16
          OUT 1,AX
          JEQ 00D
          CMP E06
          JNE 03C
          MSG Mostrar el total de aportes al FSP de los empleados
          LDF E18
          OUT 1,AX
          JEQ 00D
          CMP E07
          JNE 042
          MSG Mostrar el total de retencion en la fuente por la DIAN
          LDF E1A
          OUT 1,AX
          JEQ 00D
          HLT
          
#050
MSG Se Empiezan los calculos
JMP 00A
          
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
#E0E
1111111111111111
0111111111111111
