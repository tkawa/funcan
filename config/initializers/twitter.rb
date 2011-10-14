Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  # config.gateway = APIGEE_HOSTNAME
end