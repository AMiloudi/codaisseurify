require 'rails_helper'

describe "Update an Artist" do
  let!(:artist) {create :artist, name: "Rihanna" }

  it "Update the artist" do
    visit artists_url

    expect(page).to have_text("Rihanna")

    click_on "Update"
    fill_in "Name", with: "Not rihanna"
    click_on "Save"

    expect(page).to have_text("Your artist has been succesfully updated")
    expect(page).to have_text("Not rihanna")
  end

end
