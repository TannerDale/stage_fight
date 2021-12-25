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

  describe 'with open positions' do
    let!(:user) { create :user }
    let!(:projects) { create_list :project, 5 }

    before :each do
      projects.each_with_index do |project, i|
        create_list :cast, 3, project_id: project.id, user_id: user.id

        create :cast, project_id: project.id, user_id: nil if i == 0
      end
    end

    it 'has the projects with open positions' do
      open_project = Project.with_open_positions

      expect(open_project).to eq([projects.first])
    end
  end
end
