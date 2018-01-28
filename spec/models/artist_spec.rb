require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      artist= Artist.new(name: nil)
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end
    it "is invalid without a genre" do
      artist= Artist.new(genre: nil)
      artist.valid?
      expect(artist.errors).to have_key(:genre)
    end
  end
end
