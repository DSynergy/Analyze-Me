require 'test_helper'

class MbClassifierTest < ActiveSupport::TestCase

  test 'It removes @users' do
    tweets = ["@dgsynergy: some stuff."]
    clean = MBClassifier.new.clean_tweets(tweets)
    assert_equal [": some stuff."], clean
  end

  test 'It removes a link' do
    tweets = ["https://google.com Google!"]
    clean = MBClassifier.new.clean_tweets(tweets)
    assert_equal [" Google!"], clean
  end

  test 'It removes new lines' do
    tweets = ["@dgsynergy: some stuff. \n more stuff"]
    clean = MBClassifier.new.clean_tweets(tweets)
    assert_equal [": some stuff.  more stuff"], clean
  end

  test 'It removes quotes' do
    tweets = ["@dgsynergy: some stuff. \"more stuff\""]
    clean = MBClassifier.new.clean_tweets(tweets)
    assert_equal [": some stuff. more stuff"], clean
  end

end
