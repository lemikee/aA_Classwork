# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

    User.destroy_all
    # Artwork.destroy_all
    # ArtworkShare.destroy_all
    #Comment.destroy_all
    #Like.destroy_all

    #Artists
    mike = User.create!({name: "Mike", email: "mike@gmail.com"})
    kiet = User.create!({name: "Kiet", email: "kiet@gmail.com" })
    joe = User.create!({name: "Joe", email: "joe@gmail.com" })

    #Viewers
    coco = User.create!({name: "Coco", email: "coco@gmail.com"})
    nana = User.create!({name: "Nana", email: "Nana@gmail.com" })
    waffle = User.create!({name: "Waffle", email: "Waffle@gmail.com" })

    #Artwork
    # art1 = Artwork.create!({title: "Masterpiece", image_url: "maspeace.com", artist_id: mike.id})
    # art2 = Artwork.create!({title: "Mona Lisa", image_url: "monalisa.com", artist_id: mike.id})
    # art3 = Artwork.create!({title: "Crayon Drawing", image_url: "crayon.com", artist_id: kiet.id})
    # art4 = Artwork.create!({title: "Pier", image_url: "pier.com", artist_id: kiet.id})
    # art5 = Artwork.create!({title: "Big Sur", image_url: "bigsur.com", artist_id: joe.id})
    # art6 = Artwork.create!({title: "Birds", image_url: "birds.com", artist_id: joe.id})

    #Artwork Shares
    # art_shares1 = ArtworkShare.create!({artwork_id: art1.id, viewer_id: coco.id})
    # art_shares2 = ArtworkShare.create!({artwork_id: art2.id, viewer_id: coco.id})
    # art_shares3 = ArtworkShare.create!({artwork_id: art3.id, viewer_id: nana.id})
    # art_shares4 = ArtworkShare.create!({artwork_id: art4.id, viewer_id: nana.id})
    # art_shares5 = ArtworkShare.create!({artwork_id: art5.id, viewer_id: waffle.id})
    # art_shares6 = ArtworkShare.create!({artwork_id: art6.id, viewer_id: waffle.id})

    #Comments
    # comment1 = Comment.create!({body: "whatever", user_id: coco.id, artwork_id: art1.id})
    # comment2 = Comment.create!({body: "0/10", user_id: nana.id, artwork_id: art2.id})
    # comment3 = Comment.create!({body: "The worse thing to happen to art since IG filters", user_id: waffle.id, artwork_id: art3.id})
    # comment4 = Comment.create!({body: "terrible", user_id: joe.id, artwork_id: art4.id})
    # comment5 = Comment.create!({body: "Its not bad if you're blind", user_id: kiet.id, artwork_id: art5.id})
    # comment6 = Comment.create!({body: "Meh", user_id: mike.id, artwork_id: art6.id})
end
