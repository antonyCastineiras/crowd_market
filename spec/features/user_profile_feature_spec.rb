require 'rails_helper'

feature 'Profile page' do

  before do
    sign_up(first_name="Testy",last_name="Tester",username="Test",email="test@test.com",password="password")
  end

  context 'User has signed in' do
    it 'Should display the username' do
      expect(page).to have_content('Test')
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

  context 'User has edited user profile' do
    it "should be possible to edit user profile" do
      click_link 'Edit profile'
      fill_in('user_first_name', with: "Test")
      fill_in('Current password', with: "password")
      click_button "Update"
      expect(page).to have_content("Your account has been updated successfully.")
    end
  end

  context 'User can see recent posts in user profile' do
    it 'should display your posts' do
      create_post
      click_link 'Profile'
      expect(page).to have_content('Hello World!')
    end
  end
end
