require 'rails_helper'

feature 'comments' do
  before do
    sign_up(first_name="Joe",last_name="Bloggs",username="JB123",email="JB123@test.com",password="password")
    create_post
  end

  context 'creating comments' do
    it 'users can leave a comment' do
      fill_in "comment_text", with: 'Testing'
      click_button 'Comment'
      expect(current_path).to eq '/posts'
      expect(page).to have_content ('Testing')
    end
  end

  context 'viewing comments' do
    it 'allows users to see the name of the person who commented' do
      fill_in "comment_text", with: 'Hello, world!'
      expect(current_path).to eq '/posts'
      expect(page).to have_content ('Joe Bloggs')
    end
  end

  context 'clicking a users profile' do
    it 'allows you to visit a user\'s profile via clicking on their name when they leave a comment' do
      fill_in "comment_text", with: 'Hey there!'
      click_link 'Joe Bloggs'
      expect(page).to have_content ('JB123')
      expect(page).to_not have_content ('Hey there!')
    end
    it 'users must be signed in to comment' do
      sign_out
      click_link 'Hello World!'
      expect(page).to have_content('You need to sign in to comment')
    end
  end

  context 'Editing comments' do
    it 'users can edit their comments' do
      fill_in "comment_text", with: 'Testing'
      click_button 'Comment'
      visit '/comments/2/edit'
      fill_in "comment_text", with: 'Testing Edit'
      expect(page).to have_content('Testing')
    end
    it 'user can not edit someone elses comments' do
      comment_post
      sign_out
      sign_up_user_2
      visit ('/')
      expect(page).not_to have_content "Edit comment"
    end
  end
end
