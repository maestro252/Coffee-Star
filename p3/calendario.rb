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

def calcularFestivos(y)
  #1 de enero - Año Nuevo
  #Jueves Santo
  #Viernes Santo
  #1 de mayo – Día del Trabajo
  #20 de julio – Independencia Nacional 7 de agosto – Batalla de Boyacá
  #8 de diciembre - Inmaculada Concepción 25 de diciembre - Navidad

  # 1 de enero
  y[1] *= -1

  #1 de mayo

  y[4*31 + 1] *= -1

  #20 de julio

  y[6*31 + 20] *= -1

  #8 de diciembre

  y[11*31 + 8] *= -1

  #7 de agosto

  y[7*31 + 7] *= -1

  #25 de diciembre

  y[11*31 + 25] *= -1


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

        if y[(i - 1)*31 + j].abs == dia

          if y[(i - 1)*31 + j] <= 0

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
a = calcularFestivos a
printCalendar a

puts "El 31 de Mayo es #{a[4*31 + 31]}"
puts
puts a.count
