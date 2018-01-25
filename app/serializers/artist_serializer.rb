class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :genre, :image

  has_many :songs
end
