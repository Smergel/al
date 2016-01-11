class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, length: { minimum: 1, maximum: 15 }, uniqueness: true 
  validates :avatar_file_name, presence: true
end
