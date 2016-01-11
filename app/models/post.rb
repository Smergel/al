class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :band_name, presence: true
  validates :album_name, presence: true
  validates :write_up, presence: true
  validates :youtube, presence: true
  validates :date, presence: true
  validates :band_pic, presence: true
  validates :album_art, presence: true
  validates :quote, presence: true
  validates :genre, presence: true
  validates :tracks, presence: true
  validates :fav_song, presence: true
  validates :release_year, presence: true
end
