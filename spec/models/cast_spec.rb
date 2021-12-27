require 'rails_helper'

describe Cast do
  describe 'validations' do
    it { should validate_presence_of :position }
  end

  describe 'relationships' do
    it { should belong_to(:user).optional true }
    it { should belong_to :project }
  end

  describe 'enum' do
    let(:values) { %w[owner actor actress director producer writer editor camera lights set costume]}

    it { should define_enum_for(:position).with_values(values) }
  end
end
