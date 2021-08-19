# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  activated        :boolean          default(FALSE), not null
#  activation_token :string           not null
#  email            :string           not null
#  password_digest  :string           not null
#  session_token    :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_activation_token  (activation_token) UNIQUE
#  index_users_on_email             (email)
#  index_users_on_session_token     (session_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
