require 'rails_helper'

feature 'delete one song', js: true do

  let!(:artist) { create :artist}
  let!(:song1)   { create :song, artist: artist}
  let!(:song2)   { create :song, artist: artist}
  let!(:song3)   { create :song, artist: artist}
  let!(:song4)   { create :song, artist: artist}

  scenario 'delete on song' do
    visit artist_path(artist)

    page.accept_confirm do
      click_on "Delete all songs"
    end
    expect(page).to_not have_content(song1.title)
    expect(page).to_not have_content(song2.title)
    expect(page).to_not have_content(song3.title)
    expect(page).to_not have_content(song4.title)
  end
end
