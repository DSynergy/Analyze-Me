require 'test_helper'

class MbClassifierTest < ActiveSupport::TestCase

  test 'clean tweets' do
    t_array = ["This is fantastic\n\nhttp://t.co/HZByYHZjoH http://t.co/zDsLX2dhvf", "@JohnFornander haha. Nice John", "My first fully deployed project from Turing. It uses Ruby, Rails, and Javascript to build an air BnB style website. https://t.co/xCiCar9Efk",
      "@beanaman true facts my friend. I will see you on the other side #anityatva", "@beanaman How dare you sir. To the death it is",
      "@beanaman you betray your sweet twitter? Alas!", "@beanaman ...you do remember who you are 'tweetin' to?",
      "@beanaman Yeah well, I can't actually be a real programmer without using Twitter. Have to pay to play",
      "Denver street art http://t.co/5NFVC3T7PT", "Great article on mid-20th century philosophy and the origin of computers: http://t.co/PLFf9R2D9q",
      "@FluxusFrequency Stop being so Boulder brah", "@FluxusFrequency I guess I am a real programma now or something", "The Afghanistan we don't see:\n\nhttp://t.co/Lp2tItXa0k",
      "@apsarnow yeah absolutely...what are you looking for?", "When Revolution Came to America http://t.co/pm7pUsu77v via @vice",
      "US spending bill boon for Wall Street. Exactly what the 315+ millions of Americans needed!\n\nhttp://t.co/rOGKVCHyfD",
      "@JohnFornander mmmm...K", "I miss you Peru\n\n#IncaTrail http://t.co/MtaZ8UzZPB",
      "When will people finally realize the correct government is one based on a feudal Myers-Briggs system? http://t.co/uy6KNDjwgQ",
      "@JohnFornander: So....trying this thing out. Who should be following oh master of twitter?",
      "RT @TheOnion: On today's #RNCschedule: Some awful shit about opportunity delivered by a limp-dicked old fuck who has everything http://t ...", "@beanaman .....grumble mumble...", "@beanaman Indeed!"]
    cleaned = clean_tweets(t_array)
    assert_equal cleaned, "This is fantastic, haha. Nice John, My first fully deployed project from Turing. It uses Ruby, Rails, and Javascript to build an air BnB style website,
       true facts my friend. I will see you on the other side #anityatva,  How dare you sir. To the death it is,
       you betray your sweet twitter? Alas!,  ...you do remember who you are 'tweetin' to?,
       Yeah well, I can't actually be a real programmer without using Twitter. Have to pay to play,
       Denver street art , Great article on mid-20th century philosophy and the origin of computers:
       Stop being so Boulder brah,  I guess I am a real programma now or something, The Afghanistan we don't see:
       yeah absolutely...what are you looking for?, When Revolution Came to America via @vice,
       US spending bill boon for Wall Street. Exactly what the 315+ millions of Americans needed!,
       mmmm...K, I miss you Peru IncaTrail,
       When will people finally realize the correct government is one based on a feudal Myers-Briggs system?,
       So....trying this thing out. Who should be following oh master of twitter?,
       RT : On today's #RNCschedule: Some awful shit about opportunity delivered by a limp-dicked old fuck who has everything  ...,  .....grumble mumble...,  Indeed!"
  end

end
