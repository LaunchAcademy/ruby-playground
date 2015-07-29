def multiplication_table
  1.upto(12) do |x|
    1.upto(12) do |y|
      val = x * y

      if y == 12
        print "#{val}\n"
      else
        print "#{val}\t"
      end
    end
  end
end
