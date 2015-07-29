require 'sinatra'
require 'sinatra/json'
require 'json'

configure do
  set :public_folder, 'public'
end

get '/' do
  erb :index
end
