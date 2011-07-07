class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :votes, :default => 0

      t.timestamps
    end
  end
end
