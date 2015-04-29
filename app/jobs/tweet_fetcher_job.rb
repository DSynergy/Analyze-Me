class TweetFetcherJob 
  include SuckerPunch::Job
  
  def perform
    raise NotImplementedError
  end
end
