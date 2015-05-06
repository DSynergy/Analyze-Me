require 'test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  test '#tweets_by_user' do
    VCR.use_cassette('twitter_service') do
    user = current_user
    tweets = TwitterService.new.tweets_by_user(user)
    end
  end
end
