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
  end
end
