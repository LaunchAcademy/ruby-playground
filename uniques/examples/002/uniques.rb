def uniques(list)
  list = list.split(',')
  recent = nil
  unique = []
  list.each do |number|
    if number != recent
      unique << number
      recent = number
    end
  end
  unique.join(',')
end
