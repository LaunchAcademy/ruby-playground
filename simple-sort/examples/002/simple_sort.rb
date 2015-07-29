def sort_list(list)
  list = list.split(' ').map(&:to_f)
  list = merge_sort(list).map(&:inspect).join(' ')
end

def merge_sort(list)
  return list if list.length <= 1

  middle = list.length / 2
  left = list[0,middle]
  right = list[middle..-1]

  left = merge_sort(left)
  right = merge_sort(right)
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end
