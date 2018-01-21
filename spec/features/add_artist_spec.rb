require 'rails_helper'

describe "Make sure we can add an Artist" do
  before { login_as user}
  let!(:user)   {create :user, email: "current@user.com" }

  it "Add an artist" do
    visit artists_url
    click_on "Add new artist"
    fill_in "Name", with: "Rihanna"
    fill_in "Genre", with: "Pop"
    click_on "Save"

    expect(page).to have_text("Your artist has been succesfully created")
    expect(page).to have_text("Rihanna")
  end
end
