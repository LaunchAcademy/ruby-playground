def multiplication_table(size=12)
  1.upto(size) do |x|
    1.upto(size) do |y|
      val = x * y

      if y == size
        print "#{val}\n"
      else
        print "#{val}\t"
      end
    end
  end
end
