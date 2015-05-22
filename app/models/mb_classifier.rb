require 'base64'
require 'nokogiri'

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
    @connection = Faraday.new(:url => "http://api.uclassify.com") do |faraday|
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
    #remove @users
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

  def create_XML(text, username, classifier)
    encoded_text = Base64.encode64(text.join(' '))
    "<?xml version=\"1.0\" encoding=\"utf-8\" ?>
    <uclassify xmlns=\"http://api.uclassify.com/1/RequestSchema\" version=\"1.01\">
      <texts>
        <textBase64 id=\"text_1\">#{encoded_text}</textBase64>
      </texts>
      <readCalls readApiKey=\"pFfqHiHLgy7YXQAome6DMprkehY\">
        <classify id=\"call_1\" username=\"#{username}\" classifierName=\"#{classifier}\" textId=\"text_1\"/>
      </readCalls>
    </uclassify>"
  end

  def classify_introversion(text)
    #extraverison vs. introvesion
    response = @connection.post '', create_XML(text, 'prfekt', 'Myers Briggs Attitude')
    response.body
  end

  def classify_intuition(text)
    #Intuition vs. sensing
    response = @connection.post '', create_XML(text, 'prfekt', 'Myers Briggs Perceiving Function')
    response.body
  end

  def classify_thinking(text)
    #Thinking vs. feeling
    response = @connection.post '', create_XML(text, 'prfekt', 'Myers Briggs Judging Function')
    response.body
  end

  def classify_judging(text)
    #Judging vs perceiving
    response = @connection.post '', create_XML(text, 'prfekt', 'Myers Briggs Lifestyle')
    response.body
  end

  def classify_sentiment(text)
    #Overall sentiment
    response = @connection.post '', create_XML(text, 'prfekt', 'Mood')
    response.body
  end

  def classify_main_topics(text)
    #Main topics
    response = @connection.post '', create_XML(text, 'uClassify', 'Topics')
    response.body
  end

  def classify_age(text)
    #Age range of person
    response = @connection.post '', create_XML(text, 'uClassify', 'Ageanalyzer')
    response.body
  end

  def categorize_user(user)
    grabbing_data_from_apis(user)
    parsing_data_from_apis(user)
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

  def parsing_data_from_apis(user)

    user.introversion             = grab_values_from_xml_document((Nokogiri::XML(introversion_classification)), 3).to_f * 100
    user.extraversion             = grab_values_from_xml_document((Nokogiri::XML(introversion_classification)), 1).to_f * 100
    user.intuition                = grab_values_from_xml_document((Nokogiri::XML(intuition_classification)),    3).to_f * 100
    user.sensing                  = grab_values_from_xml_document((Nokogiri::XML(intuition_classification)),    1).to_f * 100
    user.thinking                 = grab_values_from_xml_document((Nokogiri::XML(thinking_classification)),     3).to_f * 100
    user.feeling                  = grab_values_from_xml_document((Nokogiri::XML(thinking_classification)),     1).to_f * 100
    user.judging                  = grab_values_from_xml_document((Nokogiri::XML(judging_classification)),      1).to_f * 100
    user.perceiving               = grab_values_from_xml_document((Nokogiri::XML(judging_classification)),      3).to_f * 100

    user.negative_sentiment       = grab_values_from_xml_document((Nokogiri::XML(sentiment_classification)),    3).to_f * 100
    user.positive_sentiment       = grab_values_from_xml_document((Nokogiri::XML(sentiment_classification)),    1).to_f * 100

    user.topic_arts               = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 1).to_f  * 100
    user.topic_business           = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 3).to_f  * 100
    user.topic_computers          = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 5).to_f  * 100
    user.topic_games              = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 7).to_f  * 100
    user.topic_health             = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 9).to_f  * 100
    user.topic_home               = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 11).to_f * 100
    user.topic_recreation         = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 13).to_f * 100
    user.topic_science            = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 15).to_f * 100
    user.topic_society            = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 17).to_f * 100
    user.topic_sports             = grab_values_from_xml_document((Nokogiri::XML(topic_classification)), 19).to_f * 100

    user.age_group1               = grab_values_from_xml_document((Nokogiri::XML(age_classification)), 1).to_f  * 100
    user.age_group2               = grab_values_from_xml_document((Nokogiri::XML(age_classification)), 3).to_f  * 100
    user.age_group3               = grab_values_from_xml_document((Nokogiri::XML(age_classification)), 5).to_f  * 100
    user.age_group4               = grab_values_from_xml_document((Nokogiri::XML(age_classification)), 7).to_f  * 100
    user.age_group5               = grab_values_from_xml_document((Nokogiri::XML(age_classification)), 9).to_f  * 100
    user.age_group6               = grab_values_from_xml_document((Nokogiri::XML(age_classification)), 11).to_f * 100

    user.save
    user
  end

  private

  def grab_values_from_xml_document(doc, position)
    doc.children.children.children.children.children[position].attributes["p"].value
  end

end
