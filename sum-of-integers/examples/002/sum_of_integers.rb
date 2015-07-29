def sum(file_path)
  numbers = File.read(file_path).split
  numbers.inject(0) { |sum, n| sum += n.to_i }
end
