require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'vcr'

class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
      config.cassette_library_dir  = 'test/vcr_cassettes'
      config.hook_into(:faraday)
    end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
