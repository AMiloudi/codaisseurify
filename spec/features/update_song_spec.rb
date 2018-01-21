require 'rails_helper'

describe "Making sure we can update a song" do
  before { login_as user}
  let!(:user)   {create :user, email: "current@user.com" }
  let!(:artist) { create :artist, user: user }
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
