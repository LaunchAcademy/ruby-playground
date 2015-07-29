def multiplication_table
  x = 1
  while x <= 12
    y = 1

    while y <= 12
      val = x * y

      if y == 12
        print "#{val}\n"
      else
        print "#{val}\t"
      end

      y += 1
    end

    x += 1
  end
end
