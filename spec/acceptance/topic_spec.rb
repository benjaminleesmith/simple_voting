require 'spec_helper'

describe 'topics' do
  include Rails.application.routes.url_helpers
  context 'creating a topic' do
    before do
      login
    end

    it 'should give me extra votes when I create a topic' do
      @user.votes_left.should == User::WEEKLY_VOTES
      visit new_topic_path
      fill_in 'Title', with: 'rspec testing'
      click_button 'Create Topic'
      @user.reload
      @user.votes_left.should == User::WEEKLY_VOTES + User::NEW_TOPIC_VOTES
      Topic.first.user.should == @user
    end
  end
end