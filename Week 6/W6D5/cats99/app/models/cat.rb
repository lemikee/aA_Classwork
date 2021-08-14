require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :sex, inclusion: { in: %w(M F RASCAL NB), message: "Please choose M, F, RASCAL, OR NB!!!" }

  validates_presence_of :color, :name, :sex, :birth_date

  def age
    time_ago_in_words(birth_date)
  end
end
