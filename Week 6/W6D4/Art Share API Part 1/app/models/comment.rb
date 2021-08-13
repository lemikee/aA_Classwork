# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_artwork_id  (artwork_id)
#  index_comments_on_body        (body)
#  index_comments_on_user_id     (user_id)
#
class Comment < ApplicationRecord
  validates_presence_of :body

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork


end
