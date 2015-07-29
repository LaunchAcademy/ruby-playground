def uniques(list)
  uniques = []
  numbers = list.split(',')
  last = ""
  numbers.each do |number|
    if last != number
      uniques << number
      last = number
    end
  end
  uniques.join(",")
end
