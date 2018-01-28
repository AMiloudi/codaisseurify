require 'rails_helper'

feature 'create song', js: true do


  let!(:artist) { create :artist}
  scenario 'create a song' do
    visit artist_path(artist)


    fill_in 'Title', with: 'shut up and drive'
    fill_in 'song_released_year', with: '2008'


    page.execute_script("$('#new_song').submit()")

    expect(page).to have_content('shut up and drive')
  end
end
