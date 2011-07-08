require 'spec_helper'

describe 'topic' do
  before do
    @topic = Factory.create(:topic)
  end
  
  describe 'vote' do
    it 'should increment the vote count' do
      
      user = Factory.create(:user)
      @topic.votes.should == 0
      
      @topic.vote(user).should be
      @topic.votes.should == 1
    end
  end
  
  describe 'validations' do
    it 'should validate that the user voting has votes left' do
      user = Factory.create(:user, votes_left: 0)
      @topic.vote(user).should_not be
      @topic.errors[:votes].should include('You do not have any more votes!')
      @topic.reload
      @topic.votes.should == 0
    end
  end
end