class MBClassifier
  def initialize
    @connection = Faraday.new(:url => "http://uclassify.com/") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def classify(text)
    parsed = URI.encode("browse/prfekt/Myers Briggs Perceiving Function/ClassifyText?readkey=pFfqHiHLgy7YXQAome6DMprkehY&text=#{@text}&version=1.01&output=json")
    response = @connection.get parsed
    response.body

    # 3 other api requests
    MBResult.new("INTJ", { sensing: '0.99', intuition: '0.11'})
  end
end

# in my background job
# user = User.find(1)
# classificer = MBClassifer.new
# result = classifer.classify
# user.create_mb_result(classification: 'INTJ', sensing: '0.99', intuition: '0.11')
