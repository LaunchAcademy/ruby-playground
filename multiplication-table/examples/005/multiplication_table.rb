def multiplication_table(size=12)
  x = 1
  while x <= size
    y = 1

    while y <= size
      val = x * y

      if y == size
        print "#{val}\n"
      else
        print "#{val}\t"
      end

      y += 1
    end

    x += 1
  end
end
