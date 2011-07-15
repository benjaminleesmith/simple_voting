class Topic < ActiveRecord::Base
  attr_accessor :user
  validate :validate_user_votes
  validates_presence_of :title
  
  def vote(u)
    self.user = u
    self.user.votes_left -= 1
    self.votes += 1
    Topic.transaction do
      self.save && self.user.save
    end
  end
  
  def validate_user_votes
    errors[:votes] = 'You do not have any more votes!' if self.user && self.user.votes_left < 0
  end
end
