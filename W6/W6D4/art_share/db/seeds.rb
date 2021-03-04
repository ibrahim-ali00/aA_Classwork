# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(username: "John")
user2 = User.create!(username: "Jane")
artwork1 = Artwork.create!(title: "Flower", image_url: "flower.com", artist_id: 1)
artwork2 = Artwork.create!(title: "Waves", image_url: "wave.com", artist_id: 2)
artwork_share1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 1)
artwork_share1 = ArtworkShare.create!(artwork_id: 2, viewer_id: 2)
