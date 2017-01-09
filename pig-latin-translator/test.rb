require_relative "translate"

def assert_equals(a, b)
  if a != b
    raise "assertion failed: #{a} does not equal #{b}"
  end
end

assert_equals(translate("happy"), "appyhay")
assert_equals(translate("duck"), "uckday")
assert_equals(translate("child"), "ildchay")

assert_equals(translate("egg"), "eggway")
assert_equals(translate("hello world"), "ellohay orldway")
assert_equals(translate("these pretzels are making me thirsty"),
  "esethay etzelspray areway akingmay emay irstythay")

puts "All tests passing..."
