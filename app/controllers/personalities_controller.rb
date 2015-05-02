class PersonalitiesController < ApplicationController

  def create
    classifier = MBClassifier.new

    text = classifier.clean_tweets(current_user.tweets.map(&:tweet))
    introversion_classification = classifier.classify_introversion(text)
    intuition_classification = classifier.classify_intuition(text)
    thinking_classification = classifier.classify_thinking(text)
    judging_classification = classifier.classify_judging(text)

    introversion_parsed = JSON.parse(introversion_classification)
    Personality.create(introversion: parsed['cls1']['Introversion'] , extroversion: parsed['cls1']['Extroversion'])
    intuition_parsed = JSON.parse(intuition_classification)
    Personality.create(intuition: parsed['cls1']['iNtuition'] , sensing: parsed['cls1']['Sensing'])
    thinking_parsed = JSON.parse(thinking_classification)
    Personality.create(thinking: parsed['cls1']['Thinking'] , feeling: parsed['cls1']['Feeling'])
    judging_parsed = JSON.parse(judging_classification)
    Personality.create(judging: parsed['cls1']['Judging'] , perceiving: parsed['cls1']['Perceiving'])
  end

end
