#!/Users/jonathaneidelman/.rvm/rubies/ruby-2.1.3/bin/ruby

#int dayofweek(int y, int m, int d){
#  static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
#  y -= m < 3;
#  return (y + y/4 - y/100 + y/400 + t[m-1] + d) % 7;
#}

def dow(y, m, d)
  t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
  y -= 1 if m < 3
  return (y + y/4 - y/100 + y/400 + t[m-1] + d) % 7
end

def calcularFestivos(y, anio)
  #1 de enero - Año Nuevo
  #Jueves Santo
  #Viernes Santo
  #1 de mayo – Día del Trabajo
  #20 de julio – Independencia Nacional 7 de agosto – Batalla de Boyacá
  #8 de diciembre - Inmaculada Concepción 25 de diciembre - Navidad

  # 1 de enero
  y[1] += 10

  #1 de mayo

  y[4*31 + 1] += 10

  #20 de julio

  y[6*31 + 20] += 10

  #8 de diciembre

  y[11*31 + 8] += 10

  #7 de agosto

  y[7*31 + 7] += 10

  #25 de diciembre

  y[11*31 + 25] += 10

  # 6 de enero - Epifanía del Señor
  # 19 de marzo - Día de San José
  # !!Ascensión del Señor (Sexto domingo después de Pascua)
  # !!Corpus Christi (Octavo domingo después de Pascua)
  # !!Sagrado Corazón de Jesús (Noveno domingo después de Pascua)
  # !!jueves y viernes santo (semana anterior a pascua)
  # 29 de Junio San Pedro y San Pablo
  # 15 de agosto - Asunción de la Virgen!
  # 12 de octubre - Día de la Raza
  # 1 de noviembre - Todos los Santos
  # 11 de noviembre - Independencia de Cartagena.

  # #6 de enero
  y[((7 - y[6] + 1) % 7) + (6)] += 10
  $f1 = ((7 - y[6] + 1) % 7) + (6)

  # #19 de marzo

  y[((7 - y[2*31 + 19] + 1) % 7) + (2*31 + 19)] += 10
  $f2 = ((7 - y[2*31 + 19] + 1) % 7) + (2*31 + 19)

  # #29 de Junio

  y[(((8 - y[5*31 + 29] + 1) % 8) + (5*31 + 29))] += 10
  $f3 = (((8 - y[5*31 + 29] + 1) % 8) + (5*31 + 29))

  # #15 de agosto

  y[((7 - y[7*31 + 15] + 1) % 7) + (7*31 + 15)] += 10
  $f4 = ((7 - y[7*31 + 15] + 1) % 7) + (7*31 + 15)
  # #12 de octubre

  y[((7 - y[9*31 + 12] + 1) % 7) + (9*31 + 12)] += 10
  $f5 = ((7 - y[9*31 + 12] + 1) % 7) + (9*31 + 12)
  # #1 de noviembre

  y[((7 - y[10*31 + 1] + 1) % 7) + (10*31 + 1)] += 10
  $f6 = ((7 - y[10*31 + 1] + 1) % 7) + (10*31 + 1)
  # #11 de noviembre

  y[((7 - y[10*31 + 11] + 1) % 7) + (10*31 + 11)] += 10
  $f7 = ((7 - y[10*31 + 11] + 1) % 7) + (10*31 + 11)
  # #Calculo del domingo de pascua

  a = anio % 19
  b = anio / 100
  c = anio % 100
  d = b / 4
  e = b % 4
  f = (b + 8) / 25
  g = (b - f + 1) / 3
  h = (19*a + b - d - g + 15) % 30
  i = c / 4
  k = c % 4
  l = (32 + 2*e + 2*i - h - k) % 7
  m = (a + 11*h + 22* l) / 451
  n = h + l - 7*m + 144
  $monthOfEaster = n / 31
  $dayOfEaster = 1 + (n % 31)

  $monthOfEaster -= 1
  $dayOfEaster += 1

  y[($monthOfEaster - 1)*31 + $dayOfEaster - 2] += 10 #viernes santo
  y[($monthOfEaster - 1)*31 + $dayOfEaster - 3] += 10 # jueves santo

  #dia de la ascencion y[((7 - y[10*31 + 11] + 1) % 7) + (10*31 + 11)] += 10

  y[((7 - y[($monthOfEaster - 1)*31 + $dayOfEaster + 42] + 1) % 7) + (($monthOfEaster - 1)*31 + $dayOfEaster + 42)] += 10
  $f8 = ((7 - y[($monthOfEaster - 1)*31 + $dayOfEaster + 42] + 1) % 7) + (($monthOfEaster - 1)*31 + $dayOfEaster + 42)


  #corpus Christi

  y[((7 - y[($monthOfEaster - 1)*31 + $dayOfEaster + 63] + 1) % 7) + (($monthOfEaster - 1)*31 + $dayOfEaster + 63)] += 10
  $f9 = ((7 - y[($monthOfEaster - 1)*31 + $dayOfEaster + 63] + 1) % 7) + (($monthOfEaster - 1)*31 + $dayOfEaster + 63)
  #sagrado corazon
  contNil = 0
  i = ($monthOfEaster - 1) * 31 + $dayOfEaster
  while i < ($monthOfEaster - 1) * 31 + $dayOfEaster + 72
    if y[i] == nil
      contNil += 1
    end
    i += 1
  end
  puts contNil
  y[((7 - y[($monthOfEaster - 1)*31 + $dayOfEaster + 70 + contNil] + 1) % 7) + (($monthOfEaster - 1)*31 + $dayOfEaster + 70) + contNil] += 10
  $f10 = ((7 - y[($monthOfEaster - 1)*31 + $dayOfEaster + 70 + contNil] + 1) % 7) + (($monthOfEaster - 1)*31 + $dayOfEaster + 70 + contNil)



  return y

end

def printCalendar(y)
  meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
  dia = 0
  row = []
  for i in 1..12
    puts meses[i - 1]
    puts
    puts
    puts "D  L  M  W  J  V  S"
    puts
    puts
    j = 1
    while j <= 31

      if y[(i - 1)*31 + j] != nil

        if y[(i - 1)*31 + j] % 10 == dia

          if y[(i - 1)*31 + j] == 0 || y[(i - 1)*31 + j] > 10

            row << ("F " + j.to_s)

          else

            row << j if y[(i - 1)*31 + j] > 0

          end

          dia = (dia + 1) % 7
          j += 1

        else

          row << ""
          dia = (dia + 1) % 7

        end

        if row.count == 7 || row[row.count - 1] == 31 || row[row.count - 1] == "F 31"

          p row
          row = []
          dia = 0

        end

      else

        p row if row.count > 0
        dia = 0
        row = []
        j = 32

      end

    end

    row = []
    puts
    puts

  end

end

def calendario(y)
  year = []
  year << nil
  day = dow(y,1,1)
  #year << firstDay
  for i in 1..12

    for j in 1..31

      if i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12

        year << day
        day = (day + 1) % 7

      else

        if i == 2

          if j <= 28

            year << day
            day = (day + 1) % 7

          end

          if (y % 4 == 0 && y % 100 != 0) || (y % 4 == 0 && y % 100 == 0 && y % 400 == 0)

            if j == 29

              year << day
              day = (day + 1) % 7

            end

            if j  == 30 || j == 31

              year << nil

            end

          else

            if j == 29 || j == 30 || j == 31

              year << nil

            end

          end

        end

      end

      if (i == 4 || i == 6 || i == 11 || i == 9)

        year << day if j <= 30
        day = (day + 1) % 7 if j <= 30
        year << nil if j > 30

      end

    end

  end

  return year

end

def imprimirFecha(m, d, arr)
  #1 de enero - Año Nuevo
  #Jueves Santo
  #Viernes Santo
  #1 de mayo – Día del Trabajo
  #20 de julio – Independencia Nacional 7 de agosto – Batalla de Boyacá
  #8 de diciembre - Inmaculada Concepción 25 de diciembre - Navidad
  if m == 1 and d == 1
    return "Año nuevo."
  end

  if m == 5 and d == 1
    return "Día del trabajo."
  end

  if m == 7 and d == 20
    return "Diá de Independencia Nacional."
  end

  if m == 8 and d == 7
    return "Día de la Batalla de Boyacá."
  end

  if m == 12 and d == 8
    return "Día de la Inmaculada Concpeción."
  end

  if m == $monthOfEaster and  d == $dayOfEaster - 2
    return "Viernes Santo."
  end

  if m == $monthOfEaster and d == $dayOfEaster - 3
    return "Jueves Santo."
  end

  if arr[(m - 1)*31 + d] == 0
    return "Domingo."
  end

  # Para los Movibles por la ley Emiliani.

  # 6 de enero - Epifanía del Señor
  # 19 de marzo - Día de San José
  # !!Ascensión del Señor (Sexto domingo después de Pascua)
  # !!Corpus Christi (Octavo domingo después de Pascua)
  # !!Sagrado Corazón de Jesús (Noveno domingo después de Pascua)
  # !!jueves y viernes santo (semana anterior a pascua)
  # 29 de Junio San Pedro y San Pablo
  # 15 de agosto - Asunción de la Virgen!
  # 12 de octubre - Día de la Raza
  # 1 de noviembre - Todos los Santos
  # 11 de noviembre - Independencia de Cartagena.

  if ((m - 1)*31 + d) == $f1
    ret = "Día de la Epifanía del señor (Reyes Magos). "
    if ((m - 1)*31 + d) != (6)
      ret += "Trasladado del 6 de enero"
    end
    return ret
  end

  if ((m - 1)*31 + d) == $f2
    ret = "Día de San José. "
    if ((m - 1)*31 + d) != (81)
      ret += "Trasladado del 19 de marzo"
    end
    return ret
  end

  if ((m - 1)*31 + d) == $f3
    ret = "Día de San Pedro y San Pablo. "
    if ((m - 1)*31 + d) != (184)
      ret += "Trasladado del 29 de Junio"
    end
    return ret
  end

  if ((m - 1)*31 + d) == $f4
    ret = "Día de la Asunción de la Virgen. "
    if ((m - 1)*31 + d) != (232)
      ret += "Trasladado del 15 de agosto"
    end
    return ret
  end

  if ((m - 1)*31 + d) == $f5
    ret = "Día de la Raza. "
    if ((m - 1)*31 + d) != (291)
      ret += "Trasladado del 12 de octubre"
    end
    return ret
  end

  if ((m - 1)*31 + d) == $f6
    ret = "Día de Todos los Santos. "
    if ((m - 1)*31 + d) != (184)
      ret += "Trasladado del 1 de Noviembre"
    end
    return ret
  end

  if ((m - 1)*31 + d) == $f7
    ret = "Día de Independencia de Cartagena. "
    if ((m - 1)*31 + d) != (184)
      ret += "Trasladado del 11 de Noviembre"
    end
    return ret
  end

  if ((m - 1)*31 + d) == $f8
    ret = "Día de La Ascención del Señor. "
    # if (($monthOfEaster - 1)*31 + $dayOfEaster + 42) != $f8
    #   ret += "Trasladado del #{($dayOfEaster + 42 + 1) % 31} del mes #{$monthOfEaster + 1}" if (42 - $dayOfEaster) >= 9
    #   ret += "Trasladado del #{($dayOfEaster + 42 + 1) % 31} del mes #{$monthOfEaster + 2}" if (42 - $dayOfEaster) < 9
    # end
    return ret
  end

  if ((m - 1)*31 + d) == $f9
    ret = "Corpus Christi. "
    # if (($monthOfEaster - 1)*31 + $dayOfEaster + 63) != $f8
    #   ret += "Trasladado del #{$f8 - 63 - (($monthOfEaster - 1)* 31)} del mes #{(($f8 - 63 - $dayOfEaster)/31)+1}"
    # end
    return ret
  end

  if ((m - 1)*31 + d) == $f10
    ret = "Día del Sagrado Corazón de Jesús. "
    # if (($monthOfEaster - 1)*31 + $dayOfEaster + 70) != $f8
    #   ret += "Trasladado del #{$f8 - 70 - (($monthOfEaster - 1)* 31)} del mes #{(($f8 - 70 - $dayOfEaster)/31)+1}"
    # end
    return ret
  end

end

#Main

#puts "Ingrese el año a calcular"
#
#y = gets.chomp.to_i
#a = calendario y
#a = calcularFestivos a, y
#printCalendar a
#
#puts "El 31 de Mayo es #{a[4*31 + 31]}"
#puts
#puts a.count
#p a
#

if ARGV.size == 0
  option="no"
elsif ARGV.size == 1
  #option=ARGV.shift
  raise "Se esperaban mas argumentos"
elsif ARGV.size == 2
  option = ARGV.shift
  parameter = ARGV.shift
else
  raise "Cantidad de argumentos inválida"
end

if option == "no" then
  a = calendario 2015
  a = calcularFestivos a, 2015
  printCalendar a
elsif option == "-y"
  parameter = parameter.to_i
  if parameter > 9999 || parameter < 1583
    raise "El año ingresado no es válido"
  else
    a = calendario parameter
    a = calcularFestivos a, parameter
    printCalendar a
  end
elsif option == "-d"
  if parameter.size == 8
    y = parameter[0..3]
    m = parameter[4..5]
    d = parameter[6..7]

    y = y.to_i
    m = m.to_i
    d = d.to_i

    a = calendario y
    a = calcularFestivos a, y

    print "El dia #{d} del mes #{m} del año #{y} es Festivo por: #{imprimirFecha(m,d,a)}" if (a[(m - 1)*31 + d] == 0 || (a[(m - 1)*31 + d] > 6 && a[(m - 1)*31 + d] != nil))
    print "El dia #{d} del mes #{m} del año #{y} es Hábil" if !(a[(m - 1)*31 + d] == 0 || (a[(m - 1)*31 + d] > 6 && a[(m - 1)*31 + d] != nil))
  else
    raise "Argumento inválido"
  end
else
  raise "Opción no válida"
end
