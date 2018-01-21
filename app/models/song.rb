class Song < ApplicationRecord
  belongs_to :artist

  validates :title, presence: true, length: { maximum: 100 }
  validates :released_year, presence: true

end
