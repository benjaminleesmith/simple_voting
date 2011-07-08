require 'spec_helper'

describe 'home page' do
  include Rails.application.routes.url_helpers
  
  it 'should require the user to be logged in' do
    visit root_path
    current_path.should == new_user_session_path
    page.should have_content 'You need to sign in or sign up before continuing.'
  end
  
  it 'should show list of votable topics' do
    login
    Factory.create(:topic, title: 'controller testing')
    Factory.create(:topic, title: 'model testing')
    Factory.create(:topic, title: 'javascript testing')
    Factory.create(:topic, title: 'acceptance testing')
    Factory.create(:topic, title: 'coffeescript')
    Factory.create(:topic, title: 'sass')
    visit '/'
    page.should have_content('controller testing')
    page.should have_content('model testing')
    page.should have_content('javascript testing')
    page.should have_content('acceptance testing')
    page.should have_content('coffeescript')
    page.should have_content('sass')
  end
  
  it 'should allow voting on topics' do
    login
    Factory.create(:topic, title: 'controller testing')
    visit root_path
    click_link 'Vote!'
    current_path.should == root_path
    page.should have_content '1 Vote'
    click_link 'Vote!'
    page.should have_content '2 Votes'
  end
end

def login
  Factory.create(:user)
  visit new_user_session_path
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end