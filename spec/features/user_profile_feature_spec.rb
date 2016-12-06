require 'rails_helper'

feature 'Profile page' do

  before do
    sign_up
  end

  context 'User has signed in' do
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

  context 'User has uploaded profile picture' do
    it "should be display profile picture" do
      attach_file('image[file]', './app/assets/images/practice_image.jpg')
      click_button 'Upload'
      expect(page).to have_css("img[src*='practice_image.jpg']")
    end
  end

end
