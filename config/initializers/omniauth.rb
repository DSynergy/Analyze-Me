Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["facebook_key"], ENV["facebook_secret"], :scope => 'user_posts'
  provider :twitter, ENV["twitter_key"], ENV["twitter_secret"]
end
