require 'rails_helper'

describe "Making sure we can delete a song" do
  before { login_as user}
  let!(:user)   {create :user, email: "current@user.com" }
  let!(:artist) { create :artist, user: user }
  let!(:song)   { create :song, artist: artist }

  it "Delete the song" do
    visit artist_path(artist)
    expect(page).to have_text(song.title)
    click_on "Delete"

    expect(page).not_to have_text(song.title)
  end
end
