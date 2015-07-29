require_relative '../lib/validations.rb'

describe '#valid_email?' do
  it 'identifies valid emails' do
    expect(valid_email?('test@test.com')).to eq true
    expect(valid_email?('test@test.co.uk')).to eq true
  end

  it 'identifies invalid emails' do
    expect(valid_email?('test')).to eq false
    expect(valid_email?('test@test')).to eq false
  end
end

describe '#valid_phone_number?' do
  it 'validates length' do
    expect(valid_phone_number?('1234567890')).to eq true
    expect(valid_phone_number?('123456789')).to eq false
  end

  it 'validates numericality' do
    expect(valid_phone_number?('1234567890')).to eq true
    expect(valid_phone_number?('not a phone number')).to eq false
  end

  it 'allows parentheses' do
    expect(valid_phone_number?('(123)-456-7890')).to eq true
    expect(valid_phone_number?('123-456-7890')).to eq true
  end
end

describe '#valid_password?' do
  let(:valid_password) { "password1" }

  it "must have at least 1 number" do
    expect(valid_password?('password')).to eq false
    expect(valid_password?('password1')).to eq true
  end

  it "cannot have spaces" do
    expect(valid_password?('pas sword123')).to eq false
    expect(valid_password?('password123')).to eq true
  end

  it "must have be at least 8 characters long" do
    expect(valid_password?('abcdef7')).to eq false
    expect(valid_password?('abcdefg8')).to eq true
  end
end

describe '#valid_username?' do
  it "must have at least 1 letter" do
    expect(valid_username?('123456')).to eq false
    expect(valid_username?('a')).to eq true
  end

  it "can contain numbers and letters" do
    expect(valid_username?('abc123')).to eq true
  end

  it "can contain underscores" do
    expect(valid_username?('abc_123')).to eq true
  end

  it "can only contain letters, numbers, and underscores" do
    invalid_usernames = ['asd^', 'abc!defg', 'abd$']

    invalid_usernames.each do |username|
      expect(valid_username?(username)).to_not eq true
    end
  end
end

describe '#valid_credit_card_number?' do
  it 'validates a valid credit card (13, 15 or 16 digits long, starts with a 3, 4, 5 or 6 and contains only digits' do
    expect(valid_credit_card_number?('4111111111111111')).to eq true
    expect(valid_credit_card_number?('371449635398431')).to eq true
  end

  it 'does not validate an invalid credit card number' do
    expect(valid_credit_card_number?('abc')).to eq false
    expect(valid_credit_card_number?('271449635398431')).to eq false
    expect(valid_credit_card_number?('51234567890123')).to eq false
  end
end

describe '#only_numbers?' do
  it 'returns true if only digits are passed in' do
    expect(only_numbers?('1')).to eq true
    expect(only_numbers?('123')).to eq true
  end

  it 'return false if anything other than a digit is passed in' do
    expect(only_numbers?('a12')).to eq false
    expect(only_numbers?('abc')).to eq false
  end
end

describe '#only_letters?' do
  it 'returns true if only letters are passed in' do
    expect(only_letters?('abc')).to eq true
    expect(only_letters?('test')).to eq true
  end
  it 'returns false if anything other than a letter is passed in' do
    expect(only_letters?('ab2')).to eq false
    expect(only_letters?('123')).to eq false
  end
end

describe '#valid_social_security?' do
  it 'validates a valid social (9 numbers)' do
    expect(valid_social_security?('123456789')).to eq true
  end

  it 'does not validate an invalid social' do
    expect(valid_social_security?('abcd12345')).to eq false
    expect(valid_social_security?('12345678')).to eq false
    expect(valid_social_security?('123456789b')).to eq false
  end

  it 'validates a social that has dashes (123-45-6789)' do
    expect(valid_social_security?('123-45-6789')).to eq true
  end
end

describe '#valid_zipcode?' do
  it 'validates a 5 digit zip code (02111)' do
    expect(valid_zip_code?('12345')).to eq true
    expect(valid_zip_code?('21301')).to eq true
  end

  it 'does not validate an invalid zip code' do
    expect(valid_zip_code?('abc')).to eq false
    expect(valid_zip_code?('0123')).to eq false
  end

  it 'validates a 9 digit zip code (02111-1234)' do
    expect(valid_zip_code?('02111-1234')).to eq true
  end
end
