require 'spec_helper'

describe 'topic' do
  describe 'vote' do
    it 'should increment the vote count' do
      topic = Factory.create(:topic)
      topic.votes.should == 0
      
      topic.vote.should be
      topic.votes.should == 1
    end
  end
end