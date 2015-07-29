def valid_email?(email)
  regex = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  !!email.match(regex)
end

def valid_phone_number?(number)
  regex = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  !!number.match(regex)
end

def valid_password?(password)
  regex = /\A(?=.*[0-9])(\d|[a-zA-Z]|[^\s]){8,}\z/
  !!password.match(regex)
end

def valid_username?(username)
  regex = /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/
  !!username.match(regex)
end

def valid_credit_card_number?(number)
  regex = /(^[3456])\d+/
  !!number.match(regex) && [13,15,16].include?(number.size)
end

def only_numbers?(number)
  regex = /^\d+$/
  !!number.match(regex)
end

def only_letters?(word)
  regex = /^[a-zA-Z]+$/
  !!word.match(regex)
end

def valid_social_security?(social)
  regex = /^(\d){3}(-?\d{2})(-?\d{4})$/
  !!social.match(regex)
end

def valid_zip_code?(zip)
  regex = /^\d{5}(?:-\d{4})?$/
  !!zip.match(regex)
end
