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

  # #19 de marzo

  y[((7 - y[2*31 + 19] + 1) % 7) + (2*31 + 19)] += 10


  # #29 de Junio

  y[((7 - y[5*31 + 29] + 1) % 7) + (5*31 + 29)] += 10

  # #15 de agosto

  y[((7 - y[7*31 + 15] + 1) % 7) + (7*31 + 15)] += 10

  # #12 de octubre

  y[((7 - y[9*31 + 12] + 1) % 7) + (9*31 + 12)] += 10

  # #1 de noviembre

  y[((7 - y[10*31 + 1] + 1) % 7) + (10*31 + 1)] += 10

  # #11 de noviembre

  y[((7 - y[10*31 + 11] + 1) % 7) + (10*31 + 11)] += 10

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
  monthOfEaster = n / 31
  dayOfEaster = 1 + (n % 31)

  monthOfEaster -= 1
  dayOfEaster += 1

  y[(monthOfEaster - 1)*31 + dayOfEaster - 2] += 10 #viernes santo
  y[(monthOfEaster - 1)*31 + dayOfEaster - 3] += 10 # jueves santo

  #dia de la ascencion y[((7 - y[10*31 + 11] + 1) % 7) + (10*31 + 11)] += 10

  y[((7 - y[(monthOfEaster - 1)*31 + dayOfEaster + 42] + 1) % 7) + ((monthOfEaster - 1)*31 + dayOfEaster + 42)] += 10

  #corpus Christi

  y[((7 - y[(monthOfEaster - 1)*31 + dayOfEaster + 63] + 1) % 7) + ((monthOfEaster - 1)*31 + dayOfEaster + 63)] += 10
  #sagrado corazon

  y[((7 - y[(monthOfEaster - 1)*31 + dayOfEaster + 70] + 1) % 7) + ((monthOfEaster - 1)*31 + dayOfEaster + 70)] += 10




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

#Main

puts "Ingrese el año a calcular"

y = gets.chomp.to_i
a = calendario y
a = calcularFestivos a, y
printCalendar a

puts "El 31 de Mayo es #{a[4*31 + 31]}"
puts
puts a.count
p a

