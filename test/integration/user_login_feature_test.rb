require 'test_helper'

class UserLoginTest < ActiveSupport::TestCase


  test 'a user can login with twitter' do
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
     'provider' => 'twitter',
     'uid' => '123545',
     'user_info' => {
       'name' => 'mockuser',
       'image' => 'mock_user_thumbnail_url'
      },
     'credentials' => {
       'token' => 'mock_token',
       'secret' => 'mock_secret'
      }
     })

    visit "/"
    click_link_or_button "Sign up with Twitter!"
    assert page.has_content?('homepage')
  end


  test 'a user can login with facebook' do

  end


end
