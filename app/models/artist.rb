class Artist < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :songs, dependent: :destroy

  validates :name, presence:true, uniqueness:true
  validates :genre, presence:true

end
