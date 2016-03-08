require "sinatra"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}
