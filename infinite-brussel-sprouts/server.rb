require "sinatra"
require "csv"
require "json"

TWEETS_PER_PAGE = 10

def all_tweets
  @all_tweets ||= CSV.read("tweets.csv").map do |row|
    { text: row[0], username: row[1] }
  end
end

def tweets(page)
  start_index = (page - 1) * TWEETS_PER_PAGE
  all_tweets.slice(start_index, TWEETS_PER_PAGE) || []
end

def page(page_param)
  if page_param && page_param.to_i >= 1
    page_param.to_i
  else
    1
  end
end

get "/tweets" do
  page = page(params[:page])
  erb :index, locals: { tweets: tweets(page), page: page }
end

get "/tweets.json" do
  content_type :json
  tweets(page(params[:page])).to_json
end
