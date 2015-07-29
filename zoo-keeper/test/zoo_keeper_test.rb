require_relative '../lib/zoo_keeper'

describe 'earn hash methods' do
  # this before block makes the @animals hash
  # available in all of the tests
  let(:animals) do
    {
      'leopard'   => 1,
      'gorilla'   => 3,
      'hippo'     => 4,
      'zebra'     => 1,
      'lion'      => 2,
      'eagle'     => 3,
      'ostrich'   => 2,
      'alligator' => 6
    }
  end

  it 'returns a hash with only animals that start with vowels' do
    output = starts_with_vowel(animals)

    expect(output).to include 'eagle'
    expect(output).to include 'ostrich'
    expect(output).to include 'alligator'

    expect(output).to_not include 'zebra'
  end

  it 'returns a hash containing only lonely animals' do
    output = lonely_animals(animals)

    expect(output).to include 'leopard'
    expect(output).to include 'zebra'

    expect(output).to_not include 'hippo'
  end

  it 'returns a count of the total number of animals' do
    expect(total_animals(animals)).to eq 22
  end

  it 'returns a hash with newly added animals' do
    # the add_new_animals method should only add animals
    # if there are none of that type of animal already at the zoo
    # (the animals are very territorial)
    new_shipment = {
      'hippo' => 2,
      'panda' => 4,
      'tiger' => 3,
      'eagle' => 5
    }

    output = add_new_animals(animals, new_shipment)

    expect(output['hippo']).to eq 4
    expect(output['panda']).to eq 4
    expect(output['tiger']).to eq 3
    expect(output['eagle']).to eq 3
  end

  it 'returns a hash with animals grouped by count' do
    output = group_by_count(animals)

    expect(output[6]).to include 'alligator'
    expect(output[2]).to include 'ostrich'
    expect(output[2]).to include 'lion'
  end
end
