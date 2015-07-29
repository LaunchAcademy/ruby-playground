require 'csv'

def display_scores(file_path)
  scores = []

  CSV.foreach(file_path, headers: true) do |row|
    score = row.to_hash

    total = 0
    score.each do |key, val|
      total += val.to_i unless key == "Name"
    end
    score['total'] = total

    scores << score
  end

  sorted_scores = scores.sort_by do |score|
    score['total']
  end

  puts "Mini Golf Scores\n\n"
  sorted_scores.each_with_index do |score, index|
    position = index + 1
    puts "#{position}. #{score['Name']} with #{score['total']} strokes."
  end
end
