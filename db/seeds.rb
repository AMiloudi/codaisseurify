Photo.destroy_all
Song.destroy_all
Artist.destroy_all


rihanna     = Artist.create!(name: "rihanna", genre: "pop")
luis_fonsi  = Artist.create!(name: "luis_fonsi", genre: "reggaeton")
gotye       = Artist.create!(name: "gotye", genre: "pop")
wreckers    = Artist.create!(name: "wreckers", genre: "country")

w = Song.create!(title: "Work", released_year: 2016, artist: rihanna)
d = Song.create!(title: "Despacito", released_year: 2017, artist: luis_fonsi)
s = Song.create!(title: "Somebody that I used to know", released_year: 2011, artist: gotye)
m = Song.create!(title: "My oh my", released_year: 2006, artist: wreckers)


photo1= Photo.create!(remote_image_url:"http://res.cloudinary.com/amiloudi/image/upload/v1516555908/rihanna_tjgxrf.jpg", artist: rihanna)
photo2= Photo.create!(remote_image_url:"http://res.cloudinary.com/amiloudi/image/upload/v1516556052/luisfonsi_xdk0ih.jpg", artist: luis_fonsi)
photo3= Photo.create!(remote_image_url:"http://res.cloudinary.com/amiloudi/image/upload/v1516556051/gotye_jbzrhg.jpg", artist: gotye)
photo4= Photo.create!(remote_image_url:"http://res.cloudinary.com/amiloudi/image/upload/v1516556052/thewreckers_ss9ykl.jpg", artist: wreckers)
