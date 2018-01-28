require 'rails_helper'

describe "the list of artists" do
  let!(:artist1) {create :artist, name: "Artist number 1"}
  let!(:artist2) {create :artist, name: "Artist number 2"}


  it "shows all the artists" do
    visit artists_url

    expect(page).to have_text("Artist number 1")
    expect(page).to have_text("Artist number 2")
  end

end
