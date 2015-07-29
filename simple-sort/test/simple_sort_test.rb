require_relative '../lib/simple_sort'

describe 'simple sort' do
  it 'sorts a list of numbers' do
    input = "30.02 -88.87 10.58 -99.22 107.33"

    output = sort_list(input)

    expect(output).to eq "-99.22 -88.87 10.58 30.02 107.33"
  end
end
