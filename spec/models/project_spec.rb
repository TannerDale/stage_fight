require 'rails_helper'

describe Project do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :summary }
  end

  describe 'relationships' do
    it { should have_many(:casts).dependent :destroy }
    it { should have_many(:users).through :casts }
  end
end
