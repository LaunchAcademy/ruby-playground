So it's not really a multiplayer game in that users won't compete with each other, but it should support multiple games simultaneously. In this challenge you'll build an application that uses HTTP cookies to maintain the state of a game between multiple HTTP requests.

### Instructions

Build a web-based version of Rock, Paper, Scissors where the user competes against a computer AI. The game should meet the following requirements:

* Upon first visit of the app the user starts a new game against a computer opponent.
* The user can choose one of three options (rock, paper, or scissors) by submitting an HTML form.
* When the user submits their choice, the computer AI randomly chooses one of the three options and the winner receives a point. If there is a tie there is no point awarded.
* When a user submits their choice, refreshing the page should not re-submit that choice again (use the [Post/Redirect/Get pattern](http://en.wikipedia.org/wiki/Post/Redirect/Get) to avoid this scenario).
* The first player to win [best-of-three](http://en.wikipedia.org/wiki/Playoff_format#Best-of_formats) is declared the winner.
* Once the game has been won, the user has an option to restart the game.
* The app should be able to support multiple games simultaneously. This can be tested by visiting the page in multiple browsers or private browsing sessions to ensure they are using different sessions.
* No JavaScript should be used.
* No game state should be persisted on the server (i.e. no databases or files should be used).

A Sinatra application has been included with sessions enabled in the *server.rb* file.

### Sample Application

An example of the MMORPS game can be found [here](http://mmorps.herokuapp.com/).

### Tips

Consider what information you need to maintain the state of the game. Do you need to remember every action that was taken, or is it sufficient to use just the scores?

If using the [Post/Redirect/Get pattern](http://en.wikipedia.org/wiki/Post/Redirect/Get) you'll often need to pass messages along with a redirect (e.g. notifying a user what happened this round). These are called **flash messages** and are implemented using the session to store a temporary message that is wiped out after one request.

Everything that is stored in the session is encoded as a string. If storing numeric values, remember to convert them back to integers when reading from the session (using the `to_i` method).

### Extra Challenge: Insta-win Cookie

Loose lips sink ships, or in this case ensure a swift victory over our computer opponents. The secret used to generate the [HMAC](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code) for the [MMORPS example application](http://mmorps.herokuapp.com/) was leaked as `"nobody_will_ever_find_me"`. Using this information, modify the session so that the web application thinks we've won the game every time.

To view the session information, use either `telnet` or your web developer tools in your browser to view the headers sent back in the response. The session will be set via an HTTP cookie and include both the encoded session data as well as an HMAC to prevent tampering:

```no-highlight
rack.session=[ENCODED_SESSION_DATA]--[HMAC];
```

The session data is encoded but not encrypted. It can be decoded using the following method:

```ruby
require "uri"

def decode_session(str)
  Marshal.load(URI.decode_www_form_component(str).unpack("m").first)
end
```

The HMAC is generated from the encoded session as well as a secret key (supplied above). It can be generated with the following method:

```ruby
require "openssl"

def generate_hmac(data, secret)
  OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, secret, data)
end
```

Using this information, forge a new session cookie and send it in the next request that ensures humanity will always remain victorious over the impending machine uprising.
