# Example 1

HEX_MAP = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15
}

def hex_to_decimal(hex)
  reversed_chars = hex.upcase.chars.reverse
  sum = 0

  reversed_chars.each_with_index do |char, index|
    sum += HEX_MAP[char] * (16 ** index)
  end

  sum
end
