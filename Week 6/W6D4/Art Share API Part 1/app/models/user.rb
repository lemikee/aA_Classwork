# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates_presence_of :username

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :views,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare
  
  has_many :shared_artworks,
    through: :artworks,
    source: :artwork_shares,
    dependent: :destroy

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment,
    dependent: :destroy
end
