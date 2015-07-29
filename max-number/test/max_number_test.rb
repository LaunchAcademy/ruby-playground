require_relative '../lib/max_number'

describe 'max_number' do
  before :each do
    disable_instance_methods(Array, [:max, :max_by])
  end

  it 'returns the largest integer' do
    input = [5, 3, 1, 9, 4]
    expect(max_number(input)).to eq(9)
  end

  it 'returns the largest float' do
    input = [1.3, 5.9, 2.3]
    expect(max_number(input)).to eq(5.9)
  end

  it 'works with duplicate values' do
    input = [5, 5, 5]
    expect(max_number(input)).to eq(5)
  end

  it 'works with negative numbers' do
    input = [-10, -5, -1]
    expect(max_number(input)).to eq(-1)
  end

  it 'returns nil for an empty array' do
    input = []
    expect(max_number(input)).to be_nil
  end

  def disable_instance_methods(klass, method_names)
    method_names.each do |method|
      klass.any_instance.stub(method) do
        raise ScriptError.new("The `#{method}` method cannot be used for this test.")
      end
    end
  end
end
