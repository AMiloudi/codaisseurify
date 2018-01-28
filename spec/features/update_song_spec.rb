require 'rails_helper'

describe "Making sure we can update a song" do
  let!(:artist) { create :artist }
  let!(:song)   { create :song, artist: artist }

  it "update the song" do
    visit artist_path(artist)
    expect(page).to have_text(song.title)

    click_on "Update"
    fill_in "Title", with: "New song title"
    click_on "Save"

    expect(page).to have_text("New song title")
  end
end
