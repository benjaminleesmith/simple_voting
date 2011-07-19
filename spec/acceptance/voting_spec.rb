require 'spec_helper'

describe 'voting' do
  include Rails.application.routes.url_helpers

  it 'should allow voting on topics' do
    login
    Factory.create(:topic, title: 'controller testing', user: @user)
    visit root_path
    click_link 'Vote!'
    current_path.should == root_path
    page.should have_content '1 Vote'
    click_link 'Vote!'
    page.should have_content '2 Votes'
  end
  
  it 'should decrement the votes left for a user when voting' do
    login
    Factory.create(:topic, title: 'controller testing', user: @user )
    @user.votes_left = 3
    @user.save!
    
    visit root_path
    click_link 'Vote!'
    @user.reload
    page.should have_content "Thanks for voting! You have 2 Votes left."
    
    click_link 'Vote!'
    @user.reload
    page.should have_content "Thanks for voting! You have 1 Vote left."
    
    click_link 'Vote!'
    @user.reload
    page.should have_content "Thanks for voting! You have 0 Votes left."
  end
end