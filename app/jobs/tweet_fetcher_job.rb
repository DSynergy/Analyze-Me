class TweetFetcherJob
  include SuckerPunch::Job

  def perform
    TweetFetcherJob.new.async.perform("fetch my tweets bro")
  end

end
