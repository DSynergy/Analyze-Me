class MBClassifier
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => "http://uclassify.com/") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def clean_tweets(tweets)
    #removes links
    cleaned_tweets = tweets.each do |tweet|
      tweet.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
    end
    #remove @user
    cleaned_tweets.each do |tweet|
      tweet.gsub!(/@(\w+)/, '')
    end
    #remove new lines
    cleaned_tweets.each do |tweet|
      tweet.gsub!(/\n/, "")
    end
    #remove all quotes
    cleaned_tweets.each do |tweet|
      tweet.gsub!('"', "")
    end
    cleaned_tweets
  end

  def classify_introversion(text)
    #extroverison vs. introvesion
    parsed = URI.encode("browse/prfekt/Myers Briggs Attitude Function/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

  def classify_intuition(text)
    #Intuition vs. sensing
    parsed = URI.encode("browse/prfekt/Myers Briggs Perceiving Function/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

  def classify_thinking(text)
    #Thinking vs. feeling
    parsed = URI.encode("browse/prfekt/Myers Briggs Judging Function/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

  def classify_judging(text)
    #Judging vs perceiving
    parsed = URI.encode("browse/prfekt/Myers Briggs Lifestyle Function/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

end

# in my background job
# user = User.find(1)
# classificer = MBClassifer.new
# result = classifer.classify
# user.create_mb_result(classification: 'INTJ', sensing: '0.99', intuition: '0.11')
