class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['HAR_CONSUMER_KEY']
      config.consumer_secret = ENV['HAR_CONSUMER_SECRET']
      config.access_token = ENV['HAR_ACCESS_TOKEN']
      config.access_token_secret = ENV['HAR_ACCESS_SECRET']
    end
  end
end
