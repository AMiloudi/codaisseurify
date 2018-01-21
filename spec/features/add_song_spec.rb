require 'rails_helper'

describe "Making sure we can add a song" do
  before { login_as user}
  let!(:user)   {create :user, email: "current@user.com" }
  let!(:artist) { create :artist, user: user }

  it "adds a song" do
    visit artist_path(artist)
    click_on "Add new Song"
    fill_in "Title", with: "Hoi"
    fill_in "Year released", with: "2017"
    click_on "Save"
    expect(page).to have_text("Hoi")
  end
end
