schedule = []
2.times do |week_index|
  schedule[week_index] = []
  5.times do |day_index|
    if day_index == 1
      schedule[week_index][day_index] = 'Rotary Club'
    elsif day_index == 3
      schedule[week_index][day_index] = 'City Hall'
    elsif day_index == 4
      schedule[week_index][day_index] = 'Date Night'
    else
      schedule[week_index][day_index] = nil
    end
  end
end

schedule[1][2] = 'Boston'

puts "When would you like Billy to speak?"
day = gets.chomp

week_map = {
  'Monday' => 0,
  'Tuesday' => 1,
  'Wednesday' => 2,
  'Thursday' => 3,
  'Friday' => 4
}

while day != 'exit' do
  desired_week = 0
  if day.include?('Next')
    desired_week = 1
  end

  desired_day = nil
  week_map.each do |day_name, index|
    if day.include?(day_name)
      desired_day = index
      break
    end
  end

  if schedule[desired_week][desired_day].nil?
    puts "Billy is available then!"
    puts "Where will he be speaking?"
    schedule[desired_week][desired_day] = gets.chomp
    puts "Ok, got it!"
  else
    puts "Sorry, Billy is at the #{schedule[desired_week][desired_day]} then"
  end

  puts ""

  puts "When would you like Billy to speak?"
  day = gets.chomp
end
