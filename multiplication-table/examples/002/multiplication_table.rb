def multiplication_table
  (1..12).each do |x|
    (1..12).each do |y|
      val = x * y

      if y == 12
        print "#{val}\n"
      else
        print "#{val}\t"
      end
    end
  end
end
