require_relative '../lib/uniques'

describe 'uniques' do
  it 'should remove duplicates from string' do
    input = '1,1,1,2,2,3,3,4,4'

    output = uniques(input)

    expect(output).to eq '1,2,3,4'
  end
end
