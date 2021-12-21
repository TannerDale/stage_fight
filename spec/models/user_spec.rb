require 'rails_helper'

describe User do
  describe 'validations' do
    describe 'presence' do
      it { should validate_presence_of :username }
      it { should validate_presence_of :first_name }
      it { should validate_presence_of :last_name }
      it { should validate_presence_of :email }
      it { should validate_presence_of :password }
      it { should validate_presence_of(:password_confirmation).on :create }
    end

    describe 'uniqueness' do
      it { should validate_uniqueness_of :username }
      it { should validate_uniqueness_of :email }
    end
  end

  describe 'relationships' do
    it { should have_many :casts }
    it { should have_many(:projects).through :casts }
  end
end
