require 'csv'

def display_scores(file_path)
  scores = parse_scores(file_path)
  sorted_scores = sort_scores(scores)

  puts "Mini Golf Scores\n\n"
  sorted_scores.each_with_index do |score, index|
    position = index + 1
    puts "#{position}. #{score['Name']} with #{score['total']} strokes."
  end
end

def parse_scores(file_path)
  scores = []

  CSV.foreach(file_path, headers: true) do |row|
    score = row.to_hash

    score.each do |key, val|
      score[key] = val.to_i unless key == "Name"
    end

    score['total'] = total_score(score)

    scores << score
  end

  scores
end

def total_score(score)
  total = 0
  score.each do |key, val|
    total += val unless key == "Name"
  end
  total
end

def sort_scores(scores)
  scores.sort_by do |score|
    score['total']
  end
end
