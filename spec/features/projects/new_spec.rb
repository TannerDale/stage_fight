require 'rails_helper'

describe 'Projects New Page' do
  before { visit new_project_path }

  context 'with valid params' do
    it 'creates a new project and redirects to root path' do
      fill_in 'project[title]', with: 'Hello'
      fill_in 'project[summary]', with: 'World'
      click_button 'Create Project'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Project Created'
      expect(Project.count).to eq(1)
    end
  end

  context 'with invalid params' do
    it 'rejects missing title and summary' do
      click_button 'Create Project'

      expect(current_path).to eq new_project_path
      expect(page).to have_content "Title can't be blank and Summary can't be blank. Please try again."
      expect(Project.count).to eq(0)
    end

    it 'rejects missing title' do
      fill_in 'project[summary]', with: 'World'
      click_button 'Create Project'

      expect(current_path).to eq new_project_path
      expect(page).to have_content "Title can't be blank. Please try again."
      expect(Project.count).to eq(0)
    end

    it 'rejects missing summary' do
      fill_in 'project[title]', with: 'World'
      click_button 'Create Project'

      expect(current_path).to eq new_project_path
      expect(page).to have_content "Summary can't be blank. Please try again."
      expect(Project.count).to eq(0)
    end
  end
end
