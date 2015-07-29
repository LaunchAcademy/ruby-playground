require_relative '../lib/round_robin'

describe 'schedule_tournament' do
  context 'with an even number of teams' do
    it 'creates a single match given two names' do
      names = ['Barry Zuckerkorn', 'Bob Loblaw']

      schedule = schedule_tournament(names)
      expect(schedule.length).to eq(1)

      round = schedule[0]
      expect(round.length).to eq(1)

      match = round[0]
      expect(match).to include('Barry Zuckerkorn')
      expect(match).to include('Bob Loblaw')
    end

    it 'schedules three rounds for four names' do
      names = [
        'Mrs. Featherbottom', 'Ice the Bounty Hunter',
        'Gene Parmesan', 'Buster Bluth'
      ]

      schedule = schedule_tournament(names)
      expect(schedule.length).to eq(3)
    end

    it 'creates one match for every other name' do
      names = [
        'Adam', 'Eric', 'Sam',
        'Helen', 'Dan', 'Faizaan the Wizard'
      ]

      schedule = schedule_tournament(names)
      opponents = find_opponents_for('Adam', schedule)

      ['Eric', 'Sam', 'Helen',
        'Dan', 'Faizaan the Wizard'].each do |name|
        expect(opponents).to include(name)
      end
    end
  end

  context 'with an odd number of teams' do
    it 'schedules three rounds for three teams' do
      names = ['Julian', 'Ricky', 'Bubbles']

      schedule = schedule_tournament(names)
      expect(schedule.length).to eq(3)
    end

    it 'creates a bye week for each team' do
      names = ['Julian', 'Ricky', 'Bubbles']

      schedule = schedule_tournament(names)
      bye_weeks = find_bye_weeks(schedule)

      ['Julian', 'Ricky', 'Bubbles'].each do |name|
        expect(bye_weeks).to include(name)
      end
    end
  end

  def find_bye_weeks(schedule)
    schedule.flat_map do |round|
      round.find { |match| match.length == 1 }
    end
  end

  def find_opponents_for(name, schedule)
    schedule.map do |round|
      match = round.find do |match|
        match.include?(name)
      end

      match.reject { |n| n == name }.first
    end
  end
end
