# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
  has_many :enrollment, # method_name
    primary_key: :id, # id of the table we are pointing to
    foreign_key: :course_id, # for this table
    class_name: :enrollment # other table we are pointing to
end
