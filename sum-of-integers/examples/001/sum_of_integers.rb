def sum(file_path)
  string = File.read(file_path)
  numbers = string.split
  sum = 0

  numbers.each do |number|
    sum += number.to_i
  end

  sum
end
