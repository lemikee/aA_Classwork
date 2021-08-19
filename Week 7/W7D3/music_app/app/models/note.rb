# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  track_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_notes_on_track_id  (track_id)
#  index_notes_on_user_id   (user_id)
#
class Note < ApplicationRecord
  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the validation of user and
  # track out here.
  validates :content, presence: true

  belongs_to :user
  belongs_to :track
end
