require 'rails_helper'

feature 'Profile page' do
  context 'User has signed in' do
    before do
      sign_up
    end
    it 'Should display the username' do
      expect(page).to have_content('Test')
    end
    it 'should display the users email' do
      expect(page).to have_content('test@test.com')
    end
    it 'should display the users first name' do
      expect(page).to have_content('Testy')
    end
    it 'should display the users last name' do
      expect(page).to have_content('Tester')
    end
  end
end
