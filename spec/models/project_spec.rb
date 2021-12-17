require 'rails_helper'

describe Project do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :summary }
  end
end
