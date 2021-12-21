require 'rails_helper'

describe Cast do
  describe 'validations' do
    it { should validate_presence_of :position }
  end

  describe 'relationships' do
    it { should belong_to(:user).optional true }
    it { should belong_to :project }
  end
end
