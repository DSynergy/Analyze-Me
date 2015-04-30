# class TwitterParser
#   attr_reader :connection
#
#   def initialize
#     @connection = Faraday.new(:url => "https://api.twitter.com/1.1") do |faraday|
#       faraday.request  :url_encoded
#       faraday.response :logger
#       faraday.adapter  Faraday.default_adapter
#     end
#   end
#
#   def fetch_user_tweets(screen_name, uid = nil)
#     connection.get do |req|
#       req.url '/statuses/user_timeline', user_id: uid, screen_name: screen_name
#     end
#   end
#
# end
