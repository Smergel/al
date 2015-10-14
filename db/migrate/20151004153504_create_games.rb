class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :youtube
      t.string :artist
      t.integer :songlist_id

      t.timestamps null: false
    end
  end
end
