def multiply_lists(lists)
  first, second = lists.split("|")
  first_array = first.split(' ')
  second_array = second.split(' ')
  if first_array.length == second_array.length
    output = []
    first_array.each_with_index do |num, i|
      output << num.to_i * second_array[i].to_i
    end
    output.join(" ")
  else
    "Lists must be same length"
  end
end

def multiply_lists(lists)
  num_arrays = lists.split("|").map{|a| a.split(' ').map(&:to_i) }
  if num_arrays[0].length == num_arrays[1].length
    num_arrays[0].zip(num_arrays[1]).map{|nums| nums.reduce(:*) }.join(" ")
  else
    "Lists must be same length"
  end
end
