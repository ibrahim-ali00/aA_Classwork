# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create!(username: "Leonardo")
user2 = User.create!(username: "Donatello")
user3 = User.create!(username: "Raphael")
user4 = User.create!(username: "Michelangelo")

artwork1 = Artwork.create!(title: "Pizza time", image_url: "pizzatimeurl", artist_id: user1.id)
artwork2 = Artwork.create!(title: "Radical", image_url: "radicalurl", artist_id: user2.id)
artwork3 = Artwork.create!(title: "Slicing and Dicing", image_url: "slicinganddicingurl", artist_id: user3.id)

share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user2.id)
share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user3.id)
share3 = ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user4.id)
