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
    Factory.create(:topic, title: 'controller testing', user: @user)
    Factory.create(:topic, title: 'model testing', user: @user)
    Factory.create(:topic, title: 'javascript testing', user: @user)
    Factory.create(:topic, title: 'acceptance testing', user: @user)
    Factory.create(:topic, title: 'coffeescript', user: @user)
    Factory.create(:topic, title: 'sass', user: @user)
    visit '/'
    page.should have_content('controller testing')
    page.should have_content('model testing')
    page.should have_content('javascript testing')
    page.should have_content('acceptance testing')
    page.should have_content('coffeescript')
    page.should have_content('sass')
  end
end