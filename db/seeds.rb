Song.destroy_all
Artist.destroy_all
User.destroy_all


henk = User.create!(email: "henk@live.nl", password: "henkie")
piet = User.create!(email: "piet@live.nl", password: "pietje")
jan  = User.create!(email: "jan@live.nl", password:"jantje")

rihanna     = Artist.create!(name: "rihanna", genre: "pop")
luis_fonsi  = Artist.create!(name: "luis_fonsi", genre: "reggaeton")
gotye       = Artist.create!(name: "gotye", genre: "pop")
wreckers    = Artist.create!(name: "wreckers", genre: "country")

Song.create!(title: "Work", released_year: 2016, artist: rihanna)
Song.create!(title: "Despacito", released_year: 2017, artist: luis_fonsi)
Song.create!(title: "Somebody that I used to know", released_year: 2011, artist: gotye)
Song.create!(title: "My oh my", released_year: 2006, artist: wreckers)
