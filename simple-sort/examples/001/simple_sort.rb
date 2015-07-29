# Many soting algorithms can be found at:
# http://rosettacode.org/wiki/Sorting_algorithms

# bubble sort
def sort_list(list)
  numbers = list.split(" ").map(&:to_f)

  numbers.length.times do |j|
    for i in 1...(numbers.length - j)
      if numbers[i] < numbers[i - 1]
        numbers[i], numbers[i - 1] = numbers[i - 1], numbers[i]
      end
    end
  end
  numbers.join(" ")
end
