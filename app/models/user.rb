class User < ActiveRecord::Base
  has_many :providers, through: :user_providers
  has_many :user_providers
  has_many :tweets
  belongs_to :personality

  def self.find_or_create_from_facebook(data)
    provider = Provider.find_or_create_by(provider: data.provider, uid: data.uid)
    user = User.find_or_create_by(provider.user_id)

    user.email = data.info.email
    user.name = data.info.name
    user.gender = data.extra.raw_info.gender
    user.image = data.info.image
    user.token = data.credentials.token
    user.link = data.extra.raw_info.link
    user.location = data.extra.raw_info.locale
    user.raw_data = data

    user.save
    user
  end

  def self.find_or_create_from_twitter(data)
    provider = Provider.find_or_create_by(provider: data.provider)
    user = User.find_or_create_by(uid: data.uid)
    user.providers << provider

    user.nickname = data.info.nickname
    user.name = data.info.name
    user.location = data.info.location
    user.description = data.info.description
    user.image = data.info.image
    user.status_count = data.extra.raw_info.statuses_count
    user.token = data.credentials.token
    user.raw_data = data
    #use a background worker to find tweets when logged in
    #TweetFetcherJob.new.async.perform(user.nickname) if user.new_record?
      tweets = TwitterService.new.tweets_by_user(user.nickname)
      tweets.each do |tweet|
        Tweet.create(tweet: tweet, user_id: user.id)
      end
    user.save
    user
  end

end
