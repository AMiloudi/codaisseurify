require 'rails_helper'

describe "Viewing an individual artist" do
  before { login_as user}
  let!(:user)   {create :user, email: "current@user.com" }
  let!(:artist) { create :artist, user: user }
  let!(:song)   { create :song, artist: artist}

  it "shows list of songs on the artist page" do
    visit artist_path(artist)

    expect(page).to have_text(artist.name)
    expect(page).to have_text(artist.genre)
    expect(page).to have_text(song.title)
  end
end
