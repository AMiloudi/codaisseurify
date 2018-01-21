require 'rails_helper'

describe "Current user viewing the list of artists" do
  before { login_as user}

  let(:user)         {create :user, email: "current@user.com" }
  let(:another_user) {create :user, email: "another@user.com" }

  let!(:artist1) {create :artist, name: "Artist number 1", user: user }
  let!(:artist2) {create :artist, name: "Artist number 2", user: user }
  let!(:artist3) {create :artist, name: "Another users artist", user: another_user }

  it "shows all his artists" do
    visit artists_url

    expect(page).to have_text("Artist number 1")
    expect(page).to have_text("Artist number 2")
  end

  it "does not show other users artists" do
    visit artists_url

    expect(page).not_to have_text("Another users artist")
  end
end
