# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
  #joins table - only has foreign keys

  belongs_to :user,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User

  belongs_to :course, # method_name
    primary_key: :id, # id of the table we are pointing to
    foreign_key: :course_id, # for this table
    class_name: :Course # other table we are pointing to

  # table / model by model
    # look for foreign keys, for each foregin key write a belongs to
    # then immediately write has_many association

  # once done with belongs_to and has_many for foreign keys, then everything will be has_one
  # look for pluralization
  # enrollment <-- belongs_to a user
  # but a user HAS_MANY enrollments

  # associations, just creating links between tables
    # we want to link it with the same thing, ie foreign_key
    # primary key is always id

    # create table
    #   id
    #   name
    #   blah
    #   foreign_key <-- is the primary key for a different table, specifically the table it references
end
