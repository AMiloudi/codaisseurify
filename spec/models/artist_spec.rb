require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      artist= Artist.new(name: nil)
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end
    describe "validations" do
      it { is_expected.to validate_presence_of(:genre) }
    end
  end
end
