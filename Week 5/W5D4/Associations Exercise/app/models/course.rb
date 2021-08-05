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

  has_many :enrollments, # method_name
    primary_key: :id, # id of the table we are pointing to
    foreign_key: :course_id, # for this table
    class_name: :Enrollment # other table we are pointing to

  belongs_to :instructor, # <-- method name we choose
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User

  belongs_to :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course,
    optional: true

  # # has_many :prerecs,
  # #   primary_key: :id,
  # #   foreign_key: :prereq_id,
  # #   class_name: :Course,
  # #   optional: true
  # #   # <-- optional because not every course needs a prereq

  has_many :enrolled_students,
    through: :enrollments,
    source: :User
end
