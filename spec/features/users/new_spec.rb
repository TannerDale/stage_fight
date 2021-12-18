require 'rails_helper'

describe 'Users New Page' do
  before { visit new_users_path }

  context 'with valid params' do
    it 'creates a new user' do
      fill_in 'user[email]', with: 'Hello@gmail.com'
      fill_in 'user[username]', with: 'hello'
      fill_in 'user[first_name]', with: 'Bob'
      fill_in 'user[last_name]', with: 'Ross'
      fill_in 'user[password]', with: 'supersecret'
      fill_in 'user[password_confirmation]', with: 'supersecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(dashboard_path)
      expect(User.count).to eq(1)
      expect(User.first.email).to eq('Hello@gmail.com')
    end
  end

  context 'with invalid params' do
    it 'rejects no email' do
      fill_in 'user[username]', with: 'hello'
      fill_in 'user[first_name]', with: 'Bob'
      fill_in 'user[last_name]', with: 'Ross'
      fill_in 'user[password]', with: 'supersecret'
      fill_in 'user[password_confirmation]', with: 'supersecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(new_users_path)
      save_and_open_page
      expect(User.count).to eq(0)
    end

    it 'rejects no username' do
      fill_in 'user[email]', with: 'Hello@gmail.com'
      fill_in 'user[first_name]', with: 'Bob'
      fill_in 'user[last_name]', with: 'Ross'
      fill_in 'user[password]', with: 'supersecret'
      fill_in 'user[password_confirmation]', with: 'supersecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(new_users_path)
      expect(User.count).to eq(0)
    end

    it 'rejects no first name' do
      fill_in 'user[email]', with: 'Hello@gmail.com'
      fill_in 'user[username]', with: 'hello'
      fill_in 'user[last_name]', with: 'Ross'
      fill_in 'user[password]', with: 'supersecret'
      fill_in 'user[password_confirmation]', with: 'supersecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(new_users_path)
      expect(User.count).to eq(0)
    end

    it 'rejects no last name' do
      fill_in 'user[email]', with: 'Hello@gmail.com'
      fill_in 'user[username]', with: 'hello'
      fill_in 'user[first_name]', with: 'Bob'
      fill_in 'user[password]', with: 'supersecret'
      fill_in 'user[password_confirmation]', with: 'supersecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(new_users_path)
      expect(User.count).to eq(0)
    end

    it 'rejects no password' do
      fill_in 'user[email]', with: 'Hello@gmail.com'
      fill_in 'user[username]', with: 'hello'
      fill_in 'user[first_name]', with: 'Bob'
      fill_in 'user[last_name]', with: 'Ross'
      fill_in 'user[password_confirmation]', with: 'supersecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(new_users_path)
      expect(User.count).to eq(0)
    end

    it 'rejects no password confirmation' do
      fill_in 'user[email]', with: 'Hello@gmail.com'
      fill_in 'user[username]', with: 'hello'
      fill_in 'user[first_name]', with: 'Bob'
      fill_in 'user[last_name]', with: 'Ross'
      fill_in 'user[password]', with: 'supersecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(new_users_path)
      expect(User.count).to eq(0)
    end

    it 'rejects miss matching passwords' do
      fill_in 'user[email]', with: 'Hello@gmail.com'
      fill_in 'user[username]', with: 'hello'
      fill_in 'user[first_name]', with: 'Bob'
      fill_in 'user[last_name]', with: 'Ross'
      fill_in 'user[password]', with: 'supersecret'
      fill_in 'user[password_confirmation]', with: 'notsecret'
      fill_in 'user[bio]', with: 'Happy little tree.'

      click_button 'Create User'

      expect(current_path).to eq(new_users_path)
      expect(User.count).to eq(0)
    end
  end
end
