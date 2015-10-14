class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.integer :user_id
      t.integer :score
      t.integer :time

      t.timestamps null: false
    end
  end
end
