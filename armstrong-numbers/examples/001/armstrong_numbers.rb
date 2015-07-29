def armstrong_number?(num)
  power = num.to_s.length
  sum = 0

  num.to_s.chars.each do |char|
    sum += char.to_i ** power
  end

  sum == num
end
