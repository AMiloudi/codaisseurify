require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it "is invalid without a title" do
      song = Song.new(title: " ")
      song.valid?
      expect(song.errors).to have_key(:title)
    end
  end
  describe "validations" do
    it "is invalid without released_year" do
      song = Song.new(released_year: nil)
      song.valid?
      expect(song.errors).to have_key(:released_year)
    end
  end
end
