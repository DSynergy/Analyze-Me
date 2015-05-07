require 'test_helper'

class StaticPagesTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'a user can reach the background page' do
    visit '/'
    click_link 'Background'
    assert path('/background')
    assert page.has_content('Background')
  end

  test 'a user can reach the about page' do
    visit '/'
    click_link 'About'
    assert path('/about')
    assert page.has_content('About')
  end

  test 'a user can reach the hedonmeter page' do
    visit '/'
    click_link 'The Hedonometer'
    assert path('/hedonometer')
    assert page.has_content('The Hedonometer')
  end

  test 'a user can reach the myers-briggs page' do
    visit '/'
    click_link 'The Myers-Briggs APIs'
    assert path('/typealzyer')
    assert page.has_content('The Myers-Briggs APIs')
  end

  test 'a user can reach the type index'
    visit '/'
    click_link 'The 16 types'
    assert path('/types/type')
    assert page.has_content('INTJ')
    assert page.has_content('ENTJ')
  end

  test 'a user can reach the developer page' do
    visit '/'
    click_link 'About the developer'
    assert path('/me')
    assert page.has_content('Dustin')
    assert page.has_content('INTJ')
  end

  test 'a user can reach the privacy page' do
    visit '/'
    click_link 'Your privacy'
    assert path('/privacy')
    assert page.has_content('Privacy Statement')
  end

  test 'a user can reach the INTJ page ' do
    visit '/'
    click_link 'INTJ-The Mastermind'
    assert path('/types/INTJ')
    assert page.has_content('INTJ')
  end

  test 'a user can reach the INFJ page ' do
    visit '/'
    click_link 'INFJ-The Counselor'
    assert path('/types/INFJ')
    assert page.has_content('INFJ')
  end

  test 'a user can reach the ISTJ page ' do
    visit '/'
    click_link 'ISTJ-The Pragmatist'
    assert path('/types/ISTJ')
    assert page.has_content('ISTJ')
  end

  test 'a user can reach the ESFJ page ' do
    visit '/'
    click_link 'ESFJ-The Caregiver'
    assert path('/types/ESFJ')
    assert page.has_content('ESFJ')
  end

  test 'a user can reach the ISFJ page ' do
    visit '/'
    click_link 'ISFJ-The Nurturer'
    assert path('/types/ISFJ')
    assert page.has_content('ISFJ')
  end

  test 'a user can reach the ENFJ page ' do
    visit '/'
    click_link 'ENFJ-The Giver'
    assert path('/types/ENFJ')
    assert page.has_content('ENFJ')
  end

  test 'a user can reach the INFP page ' do
    visit '/'
    click_link 'INFP-The Romantic'
    assert path('/types/INFP')
    assert page.has_content('INFP')
  end

  test 'a user can reach the INTP page ' do
    visit '/'
    click_link 'INTP-The Thinker"'
    assert path('/types/INTP')
    assert page.has_content('INTP')
  end

  test 'a user can reach the ISTP page ' do
    visit '/'
    click_link 'ISTP-The Mechanic'
    assert path('/types/ISTP')
    assert page.has_content('ISTP')
  end

  test 'a user can reach the ISTJ page ' do
    visit '/'
    click_link 'INTJ-The Mastermind'
    assert path('/types/INTJ')
    assert page.has_content('INTJ')
  end

  test 'a user can reach the ENTJ page ' do
    visit '/'
    click_link 'ENTJ-The Executive'
    assert path('/types/ENTJ')
    assert page.has_content('ENTJ')
  end

  test 'a user can reach the ESTP page ' do
    visit '/'
    click_link 'ESTP-The Promoter'
    assert path('/types/ESTP')
    assert page.has_content('ESTP')
  end

  test 'a user can reach the ESFP page ' do
    visit '/'
    click_link 'ESFP-The Performer'
    assert path('/types/ESFP')
    assert page.has_content('ESFP')
  end

  test 'a user can reach the ENFP page ' do
    visit '/'
    click_link 'ENFP-The Inspirer'
    assert path('/types/ENFP')
    assert page.has_content('ENFP')
  end

  test 'a user can reach the ENTP page ' do
    visit '/'
    click_link 'ENTP-The Visionary'
    assert path('/types/ENTP')
    assert page.has_content('ENTP')
  end

  test 'a user can reach the ESTJ page ' do
    visit '/'
    click_link 'ESTJ-The Supervisor'
    assert path('/types/ESTJ')
    assert page.has_content('ESTJ')
  end
