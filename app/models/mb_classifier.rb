class MBClassifier
  attr_reader :connection,
              :introversion_classification,
              :intuition_classification,
              :thinking_classification,
              :judging_classification,
              :sentiment_classification,
              :topic_classification,
              :age_classification,
              :introversion_parsed,
              :intuition_parsed,
              :thinking_parsed,
              :judging_parsed,
              :sentiment_parsed,
              :topic_parsed,
              :age_parsed

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
    #extraverison vs. introvesion
    parsed = URI.encode("browse/prfekt/Myers Briggs Attitude/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
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
    parsed = URI.encode("browse/prfekt/Myers Briggs Lifestyle/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

  def classify_sentiment(text)
    #Overall sentiment
    parsed = URI.encode("browse/prfekt/Mood/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

  def classify_main_topics(text)
    #Main topics
    parsed = URI.encode("browse/uClassify/Topics/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

  def classify_age(text)
    #Age range of person
    parsed = URI.encode("browse/uClassify/Ageanalyzer/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body
  end

  def categorize_user(user)
    grabbing_data_from_apis(user)
    parsing_data_from_apis
    assigning_data_to_user(user)
  end

  def grabbing_data_from_apis(user)
    classifier                     = MBClassifier.new
    cleaned_tweets                 = classifier.clean_tweets(user.tweets.map(&:tweet))
    @introversion_classification   = classifier.classify_introversion(cleaned_tweets)
    @intuition_classification      = classifier.classify_intuition(cleaned_tweets)
    @thinking_classification       = classifier.classify_thinking(cleaned_tweets)
    @judging_classification        = classifier.classify_judging(cleaned_tweets)
    @sentiment_classification      = classifier.classify_sentiment(cleaned_tweets)
    @topic_classification          = classifier.classify_main_topics(cleaned_tweets)
    @age_classification            = classifier.classify_age(cleaned_tweets)
  end

  def parsing_data_from_apis
    @introversion_parsed           = JSON.parse(introversion_classification)
    @intuition_parsed              = JSON.parse(intuition_classification)
    @thinking_parsed               = JSON.parse(thinking_classification)
    @judging_parsed                = JSON.parse(judging_classification)
    @sentiment_parsed              = JSON.parse(sentiment_classification)
    @topic_parsed                  = JSON.parse(topic_classification)
    @age_parsed                    = JSON.parse(age_classification)
  end

  def assigning_data_to_user(user)
    user.introversion             = introversion_parsed['cls1']['Introversion']
    user.extraversion             = introversion_parsed['cls1']['Extraversion']
    user.intuition                = intuition_parsed['cls1']['iNtuition']
    user.sensing                  = intuition_parsed['cls1']['Sensing']
    user.thinking                 = thinking_parsed['cls1']['Thinking']
    user.feeling                  = thinking_parsed['cls1']['Feeling']
    user.judging                  = judging_parsed['cls1']['Judging']
    user.perceiving               = judging_parsed['cls1']['Perceiving']
    user.negative_sentiment       = sentiment_parsed['cls1']['upset']
    user.postive_sentiment        = sentiment_parsed['cls1']['happy']

    user.topic_arts               = topic_parsed['cls1']['Arts']
    user.topic_business           = topic_parsed['cls1']['Business']
    user.topic_computers          = topic_parsed['cls1']['Computers']
    user.topic_games              = topic_parsed['cls1']['Games']
    user.topic_health             = topic_parsed['cls1']['Health']
    user.topic_home               = topic_parsed['cls1']['Home']
    user.topic_recreation         = topic_parsed['cls1']['Recreation']
    user.topic_science            = topic_parsed['cls1']['Science']
    user.topic_society            = topic_parsed['cls1']['Society']
    user.topic_sports             = topic_parsed['cls1']['Sports']

    user.age_group1               = age_parsed['cls1']['13-17']
    user.age_group2               = age_parsed['cls1']['18-25']
    user.age_group3               = age_parsed['cls1']['26-35']
    user.age_group4               = age_parsed['cls1']['36-50']
    user.age_group5               = age_parsed['cls1']['51-65']
    user.age_group6               = age_parsed['cls1']['65-100']

    user.save
    user
  end

end
