require 'spec_helper'

describe 'topic' do
  describe 'create' do
    it 'should give the creating user extra votes' do
      user = Factory.create(:user, votes_left: 0)
      new_topic = Topic.new(title: 'rspec testing', user: user)
      new_topic.save!
      user.votes_left.should == User::NEW_TOPIC_VOTES
    end
  end
  
  describe 'vote' do
    it 'should increment the vote count' do
      user = Factory.create(:user)
      topic = Factory.create(:topic, user: user)


      topic.votes.should == 0
      
      topic.vote(user).should be
      topic.votes.should == User::WEEKLY_VOTES - 1
    end
  end
  
  describe 'validations' do
    it 'should validate that the user voting has votes left' do
      user = Factory.create(:user, votes_left: 0)
      topic = Factory.create(:topic, user: Factory(:user, email: 'topic@creator.com'))

      topic.vote(user).should_not be
      topic.errors[:votes].should include('You do not have any more votes!')
      topic.reload
      topic.votes.should == 0
    end
  end
end