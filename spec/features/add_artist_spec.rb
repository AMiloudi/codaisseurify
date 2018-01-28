require 'rails_helper'

describe "Make sure we can add an Artist" do

  it "Add an artist" do
    visit artists_url
    click_on "Add new Artist"
    visit new_artist_url
    fill_in "Name", with: "Pipo"
    fill_in "Genre", with: "Pop"
    click_on "Save"
    visit artists_url

    expect(page).to have_text("Pipo")
  end
end
