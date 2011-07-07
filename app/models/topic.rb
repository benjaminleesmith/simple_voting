class Topic < ActiveRecord::Base
  def vote
    self.votes += 1
    self.save
  end
end
