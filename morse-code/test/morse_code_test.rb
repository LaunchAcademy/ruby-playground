require_relative '../lib/morse_code'

describe 'morse code' do
  it 'decodes a secret morse code message' do
    code = '.... . .-.. .--. / .. .----. -- / - .-. .- .--. .--. . -.. / .. -. / - .... . / -.-. --- -- .--. ..- - . .-. -.-.-- / - .... . / .--. .- ... ... .-- --- .-. -.. / .. ... / ...-- ..--- ..... ---.. ----.'

    expect(decode(code)).to eq "HELP I'M TRAPPED IN THE COMPUTER! THE PASSWORD IS 32589"
  end
end
