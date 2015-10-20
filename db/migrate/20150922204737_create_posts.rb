class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer   :user_id
      t.string    :band_name
      t.string    :album_name
      t.text      :write_up
      t.string    :youtube
      t.datetime  :date
      t.string    :band_pic
      t.string    :album_art
      t.string    :quote
      t.string    :genre
      t.integer   :tracks
      t.string    :fav_song
      t.integer   :release_year

      t.timestamps null: false
    end
  end
end
