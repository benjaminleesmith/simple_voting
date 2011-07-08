class AddVotesLeftToUsers < ActiveRecord::Migration
  def change
    add_column :users, :votes_left, :integer, :default => User::WEEKLY_VOTES
  end
end
