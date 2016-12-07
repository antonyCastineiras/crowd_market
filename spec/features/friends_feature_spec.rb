require 'rails_helper'

feature 'Friends' do

	context 'User is signed in' do

		before do
			sign_up(first_name="Testy",last_name="Tester",username="Test",email="test@test.com",password="password")
			friend = User.create(email: "test2@test.com", password: "password", password_confirmation: "password")
		end

		scenario 'it creates a friend request' do
			click_button('Add Friend')
			fill_in 'friend', with: friend.email
			click_button('Add Friend')
			expect(friend.pending_friends.count).to eq 1 
		end

	end
end