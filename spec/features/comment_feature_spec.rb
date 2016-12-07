require 'rails_helper'

feature 'comments' do
  before do
    sign_up(first_name="Testy",last_name="Tester",username="Test",email="test@test.com",password="password")
    create_post
  end

  context 'creating comments' do
    it 'users can leave a comment' do
      click_link 'Comment'
      fill_in "comment_text", with: 'Testing'
      click_button 'Leave Comment'
      expect(current_path).to eq '/posts'
      expect(page).to have_content('Testing')
    end
  end
end
