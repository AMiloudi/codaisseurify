require 'rails_helper'

describe "Viewing an individual artist" do
  before { login_as user}
  let!(:user)   {create :user, email: "current@user.com" }
  let!(:artist) { create :artist, user: user }

  it "shows the artists details" do
    visit artist_path(artist)

    expect(page).to have_text(artist.name)
    expect(page).to have_text(artist.genre)
  end
end
