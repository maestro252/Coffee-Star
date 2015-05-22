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

def printCalendar(y)
 row = []
  for i in 1..12
    month = [[0, 1, 2, 3, 4, 5, 6]]
    for j in 1..31
      var = y[((i - 1) * 31) + j]
      #puts var 
      row.push(var)
      #p row
      if  y[((i - 1) * 31) + j] == 6
        month.push(row)
        row = []
      end 
    end
    puts "Mes #{i}"
    p month[0]
    puts
    for i in 1..month.count - 1
      p month[i]
    end 
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
      if !(i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) && i != 2
        year << day if j <= 30 
        day = (day + 1) % 7 if j <= 30
        year << nil if j > 30
      end 
    end 
  end
  return year
end 

#Main

puts "Ingrese año el año a calcular"

y = gets.chomp.to_i
a = calendario y

printCalendar a
puts a.length
puts a[35]
p a

