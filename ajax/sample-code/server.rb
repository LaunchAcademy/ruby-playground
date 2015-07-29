require "sinatra"
require "json"

get "/" do
  erb :index, locals: { fortune: random_fortune }
end

get "/new-fortune.json" do
  content_type :json

  { fortune: random_fortune }.to_json
end

def random_fortune
  # The .sample method returns a random element from an array
  FORTUNES.sample
end

FORTUNES = [
  "Expect a letter from a friend who will ask a favor of you.",
  "You are taking yourself far too seriously.",
  "Bank error in your favor.  Collect $200.",
  "Your true value depends entirely on what you are compared with.",
  "Don't let your mind wander -- it's too little to be let out alone.",
  "You will be imprisoned for contributing your time and skill to a bank robbery.",
  "Whenever you find that you are on the side of the majority, it is time to reform.",
  "You are confused; but this is your normal state.",
  "Don't read everything you believe.",
  "Keep it short for pithy sake.",
  "Abandon the search for Truth; settle for a good fantasy.",
  "Try to relax and enjoy the crisis.",
  "You will be awarded some great honor.",
  "Tuesday After Lunch is the cosmic time of the week.",
  "Blow it out your ear.",
  "You definitely intend to start living sometime soon.",
  "Don't tell any big lies today.  Small ones can be just as effective.",
  "Don't worry, be happy.",
  "Another good night not to sleep in a eucalyptus tree."
]
