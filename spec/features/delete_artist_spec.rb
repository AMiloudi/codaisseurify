require 'rails_helper'

describe "Delete an Artist" do
  before { login_as user}
  let(:user)         {create :user, email: "current@user.com" }
  let!(:artist) {create :artist, name: "Rihanna", user: user }

  it "Delete the artist" do
    visit artists_url

    expect(page).to have_text("Rihanna")

    click_on "Delete"

    expect(page).to have_text("You have succesfully deteled the artist")
    expect(page).not_to have_text("Rihanna")
  end

end
