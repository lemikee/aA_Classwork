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
require 'rails_helper'

RSpec.describe User, type: :model do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }


    subject(:capy) { FactoryBot.create(:user) }
    it { should validate_uniqueness_of(:email) }




    #Associations

    it { should have_many(:notes) }

    #Methods

    describe 'password encryption' do
        it 'does not save passwords to the DB' do
            FactoryBot.create(:user, email: 'Capy2')

            user = User.find_by(email: 'Capy2')
            expect(user.password).not_to eq('password')
            expect(user.password_digest).not_to eq('password')
        end

        it 'encrypts our password with BCrypt' do
            expect(BCrypt::Password).to receive(:create).with('abcdef')

            FactoryBot.build(:user, password: 'abcdef')
        end
    end
end
