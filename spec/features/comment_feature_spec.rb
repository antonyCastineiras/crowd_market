require 'rails_helper'

feature 'comments' do
  before do
    sign_up(first_name="Testy",last_name="Tester",username="Test",email="test@test.com",password="password")
    create_post
  end

  context 'creating comments' do
    it 'users can leave a comment' do
      fill_in "comment_text", with: 'Testing'
      click_button 'Comment'
      expect(current_path).to eq '/posts'
      expect(page).to have_content('Testing')
    end
    it 'users must be signed in to comment' do
      sign_out
      expect(page).to have_content('You need to sign in to comment')
    end
  end

  context 'Editing comments' do
    it 'users can edit their comments' do
      fill_in "comment_text", with: 'Testing'
      click_button 'Comment'
      click_link 'Edit Comment'
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
