def armstrong_number?(num)
  power = num.to_s.length
  digits = num.to_s.chars.map(&:to_i)
  sum = digits.inject(0) { |sum, d| sum += d ** power }
  sum == num
end
