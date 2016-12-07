require 'rails_helper'

feature 'Friends' do

	context 'User is signed in' do

		before do
			sign_up(first_name="Testy",last_name="Tester",username="Test",email="test@test.com",password="password")
		end

		scenario 'it creates a friend request' do
			friend = User.create(email: "test2@test.com", password: "password", password_confirmation: "password")
			fill_in 'friend_email', with: friend.email
			click_button('Add Friend')
			expect(friend.friend_requests.count).to eq 1 
		end

		scenario 'a friend request can be accepted' do
			friend = User.create(email: "test2@test.com", password: "password", password_confirmation: "password")
			fill_in 'friend_email', with: friend.email
			click_button('Add Friend')
			click_link('Sign out')
			visit('/users/sign_in')
			fill_in 'Email', with: friend.email
			fill_in 'Password', with: friend.password
			click_button("Log in")
			click_link("Friend Requests")
			click_link("Accept Request")
			expect(friend.friends.count).to eq 1
		end

		scenario 'a friend request can be rejected' do
			friend = User.create(email: "test2@test.com", password: "password", password_confirmation: "password")
			fill_in 'friend_email', with: friend.email
			click_button('Add Friend')
			click_link('Sign out')
			visit('/users/sign_in')
			fill_in 'Email', with: friend.email
			fill_in 'Password', with: friend.password
			click_button("Log in")
			click_link("Friend Requests")
			click_link("Reject Request")
			expect(friend.friends.count).to eq 0
		end

	end
end