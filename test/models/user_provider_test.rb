require 'test_helper'

class UserProviderTest < ActiveSupport::TestCase

  test 'A user has many providers' do
    user = User.create(name: 'Diego Montoya')
    user.provider.create(provider: 'facebook')
    assert_equal 'facebook', user.provider
  end

  test 'A provider has many users' do
    user = Provider.create(provider: 'Twitter')
    provider.user.create(name: 'Diego Enrique Hernando Montez')
    assert_equal 'Diego Enrique Hernando Montez', provider.user
  end

end
