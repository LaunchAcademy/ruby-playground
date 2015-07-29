def word_frequency(file_path)
  text = File.read(file_path)
  frequency = {}

  words = text.split

  words.each do |word|
    word = word.gsub(/[^a-zA-Z']/, '').downcase
    current_count = frequency[word]

    if current_count
      frequency[word] = current_count + 1
    else
      frequency[word] = 1
    end
  end

  frequency
end
