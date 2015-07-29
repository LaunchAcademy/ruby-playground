def schedule_tournament(names)
  rounds = []

  if names.length % 2 != 0
    names << nil
  end

  num_matches = names.length / 2
  num_rounds = names.length - 1

  i = 0
  while i < num_rounds
    matches = []

    j = 0
    while j < num_matches
      matches << [names[j], names[j + num_matches]].compact
      j += 1
    end

    rounds << matches

    first = names.shift
    last = names.pop
    names.unshift(last)
    names.unshift(first)

    i += 1
  end

  rounds
end
