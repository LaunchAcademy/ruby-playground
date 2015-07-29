def map(collection)
  modified = []

  collection.each do |element|
    modified << yield(element)
  end

  modified
end

def filter(collection)
  filtered = []

  collection.each do |element|
    if yield(element)
      filtered << element
    end
  end

  filtered
end

def any?(collection)
  collection.each do |element|
    if yield(element)
      return true
    end
  end

  false
end

def reduce(collection, initial = nil)
  accum = initial
  initialized = !initial.nil?

  collection.each do |element|
    if !initialized
      accum = element
      initialized = true
    else
      accum = yield(accum, element)
    end
  end

  accum
end
