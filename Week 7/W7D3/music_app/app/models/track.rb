# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  bonus      :boolean          default(FALSE), not null
#  lyrics     :text             not null
#  name       :string           not null
#  ord        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer          not null
#
# Indexes
#
#  index_tracks_on_album_id_and_ord  (album_id,ord) UNIQUE
#
class Track < ApplicationRecord
  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the validation of albums
  # out here.
  validates :lyrics, :name, :ord, presence: true
  # can't use presence validation with boolean field
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id }

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

  has_many :notes,
    dependent: :destroy

  after_initialize :set_defaults

  def set_defaults
    self.bonus ||= false
  end
end
