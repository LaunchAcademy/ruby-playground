def starts_with_vowel(animals)
  output = {}
  animals.each do |animal, count|
    if animal.start_with?('a', 'e', 'i', 'o', 'u')
      output[animal] = count
    end
  end
  output

  # using select
  # animals.select{|k,v| k.start_with?('a', 'e', 'i', 'o', 'u') }
end

def lonely_animals(animals)
  output = {}
  animals.each do |animal, count|
    if count == 1
      output[animal] = count
    end
  end
  output

  # using select and reject
  # animals.select{|k,v| v == 1 }
  # animals.reject{|k,v| v != 1 }
end

def total_animals(animals)
  total = 0
  animals.each do |animal, count|
    total += count
  end
  total

  # using reduce on values from hash
  # animals.values.reduce(:+)
  # using reduce on hash
  # animals.reduce(0) {|count, (k, v)| count += v}
end

def add_new_animals(animals, new_shipment)
  new_shipment.each do |animal, count|
    if animals[animal].nil?
      animals[animal] = count
    end
  end
  animals

  # using merge
  # new_shipment.merge(animals)
end

def group_by_count(animals)
  output = {}
  animals.each do |animal, count|
    if output[count]
      output[count] << animal
    else
      output[count] = [animal]
    end
  end
  output
end

