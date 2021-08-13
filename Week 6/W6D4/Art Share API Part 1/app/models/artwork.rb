# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer          not null
#
# Indexes
#
#  index_artworks_on_artist_id            (artist_id)
#  index_artworks_on_title_and_artist_id  (title,artist_id) UNIQUE
#
class Artwork < ApplicationRecord
  validates_presence_of :title, :image_url, :artist_id
  validates_uniqueness_of :title, { scope: :artist_id }

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
  
  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

end
