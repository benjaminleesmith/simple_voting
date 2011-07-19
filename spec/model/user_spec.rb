require 'spec_helper'

describe 'user' do
  describe 'topic.vote' do
    before do
      @topic = Factory.create(:topic, user: Factory(:user, email: 'topic@creator.com'))
    end
    
    it 'should decrement the users votes_left' do
      user = Factory.create(:user, votes_left: 5)

      user.votes_left.should == 5
      @topic.vote(user)
      user.votes_left.should == 4
      @topic.vote(user)
      user.votes_left.should == 3
    end
    
    it 'should not decement users votes_left below zero' do
      user = Factory.create(:user, votes_left: 1)
      user.votes_left.should == 1
      @topic.vote(user).should be
      user.reload
      user.votes_left.should == 0
      @topic.vote(user).should_not be
      user.reload
      user.votes_left.should == 0
    end
    
    it 'should not allow admin to be set via mass assignment' do
      user = User.new(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password', :admin => true)
      user.save!
      user.reload
      user.admin.should_not be
    end
  end
end