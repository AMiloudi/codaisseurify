require 'rails_helper'

feature 'delete one song', js: true do

  let!(:artist) { create :artist}
  let!(:song)   { create :song, artist: artist}
  scenario 'delete on song' do
    visit artist_path(artist)

    page.accept_confirm do
      click_on "Delete this song!"
    end
    expect(page).to_not have_content(song.title)
  end
end
