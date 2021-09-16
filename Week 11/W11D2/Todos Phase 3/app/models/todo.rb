# == Schema Information
#
# Table name: todos
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  done       :boolean          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Todo < ApplicationRecord
    validates_presence_of :title, :body 
    validates :done, inclusion: {in: [true, false]}
end
