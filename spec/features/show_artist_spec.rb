require 'rails_helper'

describe "Viewing an individual artist" do
  let!(:artist) { create :artist}

  it "shows the artists details" do
    visit artist_path(artist)

    expect(page).to have_text(artist.name)
    expect(page).to have_text(artist.genre)
  end
end
