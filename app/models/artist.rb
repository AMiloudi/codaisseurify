class Artist < ApplicationRecord
  # belongs_to :user
  has_many :songs, dependent: :destroy

  validates :name, presence:true, uniqueness:true
  validates :genre, presence:true
  mount_uploader :image, ImageUploader
end
